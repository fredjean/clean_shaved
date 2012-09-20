require 'execjs'
require 'digest/md5'

require 'clean_shaved/rails/railtie'
require 'clean_shaved/helpers'

module CleanShaved
  def CleanShaved.compile(name, tmpl)
    CleanShaved.cache[Digest::MD5.hexdigest("#{name}:#{tmpl}").to_sym] ||= 
      CleanShaved.context.call("Handlebars.precompile", tmpl)
  end

  private
  HANDLEBAR_PATH = File.expand_path("../../vendor/assets/javascripts/handlebars-1.0.rc.1.js", __FILE__)

  def CleanShaved.context
    @context ||= begin
                   src = IO.read(HANDLEBAR_PATH)
                   ExecJS.compile(src)
                 end
  end

  def CleanShaved.cache
    @cache ||= {}
  end
end
