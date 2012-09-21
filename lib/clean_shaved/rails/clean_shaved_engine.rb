require 'clean_shaved/helpers'

module CleanShaved
  module Rails
    class CleanShavedEngine < ::Rails::Engine
      isolate_namespace CleanShaved

      initializer "clean_shaved.assets.precompile" do |app|
        app.config.assets.precompile += %w(clean_shaved.js)
      end

      initializer "clean_shaved.helpers" do
        ActionView::Base.send :include, Helpers
      end
    end
  end
end
