module.exports = function (grunt) {
    var config = {
            pkg: grunt.file.readJSON('package.json'),
            concat: {
                all: {
                    src: ['macros/*.sjs', 'examples.sjs'],
                    dest: 'work/examples.sjs'
                }
            },
            clean: {
                all: {
                    src: 'work'
                }
            },
            sweet: {
                all: {
                    src: 'work/examples.sjs',
                    dest: 'examples.js'
                }
            },
            macro: {
              all: {}
            }
        };

    grunt.initConfig(config);

    grunt.loadNpmTasks('grunt-contrib-concat');

    grunt.registerMultiTask('macro', 'Apply macros', function() {
        grunt.task.run([    'clean',
                            'concat:all',
                            'sweet'
                        ]);
    });

    grunt.registerMultiTask('clean', 'Clean work folder', function() {
        var shell = require('shelljs'),
            options = this.data;
        shell.rm('-rf', options.src);
    });

    grunt.registerMultiTask('sweet', 'Run sweet.js', function() {
        var shell = require('shelljs'),
            options = this.data;
        shell.exec('sjs -o ' + options.dest + ' ' + options.src);
    });

    grunt.registerTask('default', ['macro']);
};

