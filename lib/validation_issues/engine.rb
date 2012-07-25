module ValidationIssues
  class Engine < ::Rails::Engine
      # Config defaults
      config.mount_at = '/'

      # Enabling assets precompiling under rails 3.1
      if Rails.version >= '3.1'
        initializer :assets do |config|
          Rails.application.config.assets.precompile += %w( validation_issues.js validation_issues.css )
        end
      end

      # Check the gem config
      initializer "check config" do |app|
        # make sure mount_at ends with trailing slash
        config.mount_at += '/'  unless config.mount_at.last == '/'
      end

  end
end
