# frozen_string_literal: true

Devise.setup do |config|
  # Configuração do remetente de e-mails
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # ORM utilizado
  require 'devise/orm/active_record'

  # Configurações de autenticação
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]

  # Configuração de segurança
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours

  # Configuração de "remember me"
  config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true

  # Configuração de logout
  config.sign_out_via = :delete
  config.sign_out_all_scopes = true

  # Configuração de respostas para Hotwire/Turbo
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
end