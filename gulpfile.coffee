gulp       = require 'gulp'
requireDir = require 'require-dir'

# Require all tasks in gulp/tasks, including subfolders
requireDir './gulp/tasks', { recurse: true }

gulp.task 'dist', ['clean'], ->
  gulp.start 'scripts', 'styles', 'minifyScripts', 'minifyStyles'

gulp.task 'build', ['clean'], ->
  gulp.start 'vendorScripts', 'clientScripts', 'html', 'haml', 'sass', 'fonts', 'images'

gulp.task 'server', ['build', 'watch']