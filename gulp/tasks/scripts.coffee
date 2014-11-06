# /*====================================
# =            Scripts task            =
# ====================================*/

browserify   = require 'browserify'
watchify     = require 'watchify'
gulp         = require 'gulp'
bundleLogger = require '../util/bundleLogger'
handleErrors = require '../util/handleErrors'
source       = require 'vinyl-source-stream'
config       = require('../config').dist.scripts

gulp.task 'scripts', ->
  bundler = browserify({
    cache: {}, packageCache: {}
    basedir: config.baseDir
    entries: config.entries
    extensions: config.extensions
  })
    .require './bower_components/jquery/dist/jquery',                                   { expose: 'jquery' }
    .require './bower_components/jquery-autosize/jquery.autosize',                      { expose: 'jquery.autosize' }
    .require './bower_components/jquery.role/lib/jquery.role',                          { expose: 'jquery.role' }
    .require './bower_components/blueimp-file-upload/js/jquery.fileupload',             { expose: 'jquery.fileupload' }
    .require './bower_components/jquery-ui/ui/core',                                    { expose: 'jquery.ui.core' }
    .require './bower_components/jquery-ui/ui/widget',                                  { expose: 'jquery.ui.widget' }
    .require './bower_components/jquery-ui/ui/mouse',                                   { expose: 'jquery.ui.mouse' }
    .require './bower_components/jquery-ui/ui/draggable',                               { expose: 'jquery.ui.draggable' }
    .require './bower_components/jquery-ui/ui/droppable',                               { expose: 'jquery.ui.droppable' }
    .require './bower_components/jquery-ui/ui/sortable',                                { expose: 'jquery.ui.sortable' }
    .require './bower_components/lodash/dist/lodash',                                   { expose: 'lodash' }
    .require './bower_components/bootstrap-sass-official/assets/javascripts/bootstrap', { expose: 'bootstrapSass' }
    .require './bower_components/react/react-with-addons',                              { expose: 'react' }
    .require './bower_components/react-mixin-manager/react-mixin-manager',              { expose: 'react-mixin-manager' }
    .require './scripts/react/resources/react_ujs',                                     { expose: 'reactUjs' }
    .require './bower_components/eventEmitter/EventEmitter',                            { expose: 'eventEmitter' }
    .require './bower_components/typeahead.js/dist/typeahead.bundle',                   { expose: 'typeahead' }

  bundle = ->
    # Log when bundling starts
    bundleLogger.start config.outputName

    return bundler
      .bundle()
      # Report compile errors
      .on 'error', handleErrors
      # Use vinyl-source-stream to make the
      # stream gulp compatible. Specifiy the
      # desired output filename here.
      .pipe source(config.outputName)
      # Specify the output destination
      .pipe gulp.dest(config.dest)
      .on 'end', ->
        bundleLogger.end config.outputName

  if global.isWatching
    # Wrap with watchify and rebundle on changes
    bundler = watchify bundler
    # Rebundle on update
    bundler.on 'update', bundle

  return bundle()