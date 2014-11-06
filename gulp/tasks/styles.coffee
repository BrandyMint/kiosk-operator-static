# /*===================================
# =            Styles Task            =
# ===================================*/

gulp         = require 'gulp'
sass         = require 'gulp-sass'
autoprefixer = require 'gulp-autoprefixer'
rename       = require 'gulp-rename'
handleErrors = require '../util/handleErrors'
config       = require('../config').dist.styles

gulp.task 'styles', ->
  gulp.src config.src
    .pipe sass(
      errLogToConsole: true
      sourceComments: 'normal'
      includePaths: [
        './app/stylesheets/'
        './app/bower_components/'
        './app/bower_components/bootstrap-sass-official/assets/stylesheets/bootstrap'
      ]
    )
    .on 'error', handleErrors
    .pipe autoprefixer('last 2 versions')
    .pipe rename config.outputName
    .pipe gulp.dest config.dest