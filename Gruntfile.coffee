module.exports = (grunt) ->

  grunt.initConfig
    'gh-pages':
      options:
        base: 'dist'
      src: ['**']

  grunt.loadNpmTasks('grunt-gh-pages')
