require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Synkmap
  class Application < Rails::Application
    config.load_defaults 8.0

    # Aqui vão as configurações do projeto
    # Se quiser configurar sessões, seria assim:
    # config.session_store :cookie_store, key: '_synkmap_session'
  end
end
