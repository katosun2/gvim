var myConfig = {
    copyRight : "Kugou.com",
    banner: '/** \r * Copyright ' + (new Date()).getFullYear() + ', ' + myConfig.copyRight + ' \r * LastChange: ' + (new Date()).toLocaleDateString() + ", " + (new Date()).toLocaleTimeString() + '\r * Compressed By uglify \r */',
	concat: {
		tpl1: {
			options: {
				process: function(src, filepath) { //do what you want
					return '// Source: ' + filepath + '\n' + src.replace(/(^|\n)[ \t]*('use strict'|"use strict");?\s*/g, '$1');
				},
				separator: ';'
			},
			dist: {
				src: ["../css/style.css", "../css/style2.css"],
				dest: '../css/style_concat.css'
			}
		},
		tpl2: {
			files: {
				'dist/basic.js': ['src/main.js'],
				'dist/with_extras.js': ['src/main.js', 'src/extras.js'],
			}
		},
	},
	uglify: {
		tpl1: {
			options: {
				banner: '/** Copyright ' + (new Date()).getFullYear() + ', Kugou.com \r * LastChange:  ' + (new Date()).toString() + '\r */',
				sourceMap: true,
				sourceMapRoot: true
			},
			files: {
                '../static/js/out.min.js': ['../static/js/vip_global.js','../static/js/yearvip.js'] //自动合并
			}
		},
        tpl2 : {
			options: {
				banner: '/** Copyright ' + (new Date()).getFullYear() + ', Kugou.com \r * LastChange:  ' + (new Date()).toString() + '\r */',
				sourceMap: true,
				sourceMapRoot: true
			},
            files: [{ 
                expand: true, 
                cwd: '../static/js', //js目录名
                ext : '.min.js', //压缩后的文件后缀
                src: ['**/*.js','!**/*.min.js','!**/*-min.js'], //文件名匹配
                dest: '../static/js' //压缩后的目录
            }]
        },
		tpl3: {
			options: {
				banner: '/** Copyright ' + (new Date()).getFullYear() + ', Kugou.com \r * LastChange:  ' + (new Date()).toString() + '\r */',
				sourceMap: true,
				sourceMapRoot: true
			},
			files: {
                '../static/js/vip_global.min.js': ['../static/js/vip_global.js']
			}
		}
	},
	yuidoc: {
		compile: {
			name: '<%= pkg.name %>',
			description: '<%= pkg.description %>',
			version: '<%= pkg.version %>',
			url: '<%= pkg.homepage %>',
			options: {
				paths: 'android_login/js/',
				//"themedir" : 'yuidoc-bootstrap-theme',
				//"helpers" : ['yuidoc-bootstrap-theme/helpers/helpers.js'],
				outdir: 'doc/'
			}
		}
	},
	cssmin: {
		minify: {
			options: {
				banner: ""
			},
			files: {
				'../css/style_concat.min.css': ['../css/style_concat.css']
			}
		}
	},
	jshint: {}
};

module.exports = function(grunt) {
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		uglify: {
			tpl3: myConfig.uglify.tpl3
		},
		watch: {
			options: {
				dateFormat: function(time) {
					grunt.log.writeln('The watch finished in ' + time + 'ms at' + (new Date()).toString());
					grunt.log.writeln('Waiting for more changes...');
				}
			},
			js: {
				files: '../static/js/vip_global.js',
				tasks: ["uglify:tpl3"]
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-yuidoc');
	grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['watch']);
};
