# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.authors = ["Frederic Jean"]
  s.name = "clean_shaved"
  s.summary = "Insert CleanShaved summary."
  s.description = "Insert CleanShaved description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]
  s.version = "0.5.0"
end
