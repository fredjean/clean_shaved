# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.authors = ["Frederic Jean"]
  s.email = "fred@fredjean.net"
  s.homepage = "https://github.com/fredjean/clean_shaved"
  s.name = "clean_shaved"
  s.summary = <<-SUMMARY
  CleanShaved makes the mustache disappear by doing the following:

  * Provides a helper to make it easier to setup Handlebars templates
  * Compiles the templates on the server to save precious client-side cycles

  Enjoy a clean shave...
  SUMMARY
  s.description = "See the Mustache disappear"
  s.files = Dir["{app,lib,config,test}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]
  s.version = "0.5.1"
end
