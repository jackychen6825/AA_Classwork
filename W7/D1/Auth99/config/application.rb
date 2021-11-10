require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NinetyNineCats
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.action_controller.default_protect_from_forgery = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g| #rails g model / controller this will change the behavior of those commands
      g.test_framework :rspec, #wtf? when we gen a test file using the rails g commans, the test framework we want to specify is rspec 
      :fixtures => false, #rails wont create fixtures for us
      #all the other stuff 5 more 
      :helper_specs => false,
      :routing_specs => false,
      :controller_specs => true, 
      :request_specs => false 
      g.fixture_replacement :factory_bot, :dir => 'spec/factories' #wtfffff
    end 
  end
end
