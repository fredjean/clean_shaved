/*
 * JavaScript support file for the clean_shaved gem.
 * (C) 2012 Frederic Jean
 * See https://github.com/fredjean/clean_shaved for further 
 * information and license.
 */

// Loads the Handlebars JS file.
//= require 'handlebars-1.0.rc.1.js'

jQuery(function() {
  Handlebars.templates = Handlebars.templates || {};

  // Compiles the templates that are declared in development mode.
  $('[type*=x-handlebars-template]').each(function() {
    var $tmpl = $(this);
    var name = $tmpl.attr('name')
    var html = '' + $tmpl.html();
    var template = Handlebars.compile(html);
    Handlebars.templates[name] = template;
  });
});


