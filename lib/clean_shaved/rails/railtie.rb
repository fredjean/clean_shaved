require 'clean_shaved/helpers'

module CleanShaved
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "clean_shaved.asset_pipeline" do |app|
        app.config.assets.precompile << "clean_shaved.js"
      end

      initializer "clean_shaved.helpers" do
        ActionView::Base.send :include, Helpers
      end
    end
  end
end
