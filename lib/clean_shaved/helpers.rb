require 'tagz'

module CleanShaved
  module Helpers
    include Tagz

    def template_for(*args, &block)
      name = args.first
      options = args.extract_options!.to_options!

      tmpl = capture(&block)

      if CleanShaved.config.compile?
        script_ type: 'text/javascript' do
          "Handlebars.templates['#{name}'] = Handlebars.template(#{CleanShaved.compile(name, tmpl)});"
            .gsub(/\s+/, ' ')
        end
      else
        options[:type] ||= "text/x-handlebars-template"
        options[:class] ||= "template"
        options[:name] ||= name

        script_(options) do
          tmpl
        end
      end
    end
  end
end
