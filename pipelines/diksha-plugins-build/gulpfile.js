var gulp = require('gulp');
var zip = require('gulp-zip');
var fs = require('fs');
var clean = require('gulp-clean');
var git = require('git-rev')
var manifest = JSON.parse(fs.readFileSync('manifest.json'));
gulp.task('clean', function() {
    return gulp.src(['dist', 'coverage', 'doc'], { read: false })
        .pipe(clean({ force: true }));
});
gulp.task('dist', ['clean'], function(cb) {
    git.short(function(gitShortCommitId) {
        gulp.src(['editor/**', 'renderer/**', 'assets/**', 'libs/**','manifest.json'], { base: '.' })
            .pipe(zip(manifest.id + '-' + manifest.ver + '-' + gitShortCommitId + '.zip'))
            .pipe(gulp.dest('dist'))
            .on('en', cb);
    });
});
gulp.task('makezip', ['clean', 'dist']);
gulp.task('default');