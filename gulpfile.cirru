
var
  gulp $ require :gulp
  coffee $ require :gulp-coffee

gulp.task :script $ \ ()
  ... gulp
    src :src/*.coffee
    pipe $ coffee $ {} (:bare true)
    pipe $ gulp.dest :lib/
