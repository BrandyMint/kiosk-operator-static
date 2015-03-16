browserify   = require 'browserify'
gulp         = require 'gulp'
source       = require 'vinyl-source-stream'
bundleLogger = require '../util/bundleLogger'
handleErrors = require '../util/handleErrors'
config       = require('../config').dist.appBundle

gulp.task 'appScripts', ->
  bundler = browserify({
    cache: {}, packageCache: {}
    basedir: config.baseDir
    entries: config.entries
    extensions: config.extensions
  }).require './bower_components/jquery-autosize/jquery.autosize',                      { expose: 'jquery.autosize' }
    .require './bower_components/jquery.role/lib/jquery.role',                          { expose: 'jquery.role' }
    .require './bower_components/blueimp-file-upload/js/jquery.fileupload',             { expose: 'jquery.fileupload' }
    .require './bower_components/jquery-ui/ui/core',                                    { expose: 'jquery.ui.core' }
    .require './bower_components/jquery-ui/ui/widget',                                  { expose: 'jquery.ui.widget' }
    .require './bower_components/jquery-ui/ui/mouse',                                   { expose: 'jquery.ui.mouse' }
    .require './bower_components/jquery-ui/ui/sortable',                                { expose: 'jquery.ui.sortable' }
    .require './bower_components/jquery-ui/ui/draggable',                               { expose: 'jquery.ui.draggable' }
    .require './bower_components/jquery-ui/ui/droppable',                               { expose: 'jquery.ui.droppable' }
    .require './bower_components/lodash/dist/lodash',                                   { expose: 'lodash' }
    .require './bower_components/bootstrap-sass-official/assets/javascripts/bootstrap', { expose: 'bootstrapSass' }
    .require './bower_components/eventEmitter/EventEmitter',                            { expose: 'eventEmitter' }
    .require './bower_components/typeahead.js/dist/typeahead.bundle',                   { expose: 'typeahead' }
    .require './bower_components/aviator/src/main',                                     { expose: 'aviator' }

  bundle = ->
    bundleLogger.start config.outputName

    return bundler
      .bundle()
      .on 'error', handleErrors
      .pipe source(config.outputName)
      .pipe gulp.dest(config.dest)
      .on 'end', ->
        bundleLogger.end config.outputName

  return bundle()