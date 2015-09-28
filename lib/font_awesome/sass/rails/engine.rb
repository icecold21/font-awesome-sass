module FontAwesome
  module Sass
    module Rails
      class Engine < ::Rails::Engine
        initializer 'font-awesome-sass.assets.precompile', group: :all do |app|
          %w(stylesheets fonts).each do |sub|
            app.config.assets.paths << root.join('assets', sub).to_s
          end

          # sprockets-rails 3 tracks down the calls to `font_path` and `image_path`
          # and automatically precompiles the referenced assets.
          unless Sprockets::Rails::VERSION.starts_with?('3')
            app.config.assets.precompile << %r(font-awesome/fontawesome-webfont\.(?:eot|svg|ttf|woff|woff2?)$)
          end
        end
      end
    end
  end
end
