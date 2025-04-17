Rails.application.config.session_store :cookie_store, 
  key: '_uzyretail_session', 
  expire_after: nil, # Expira quando o navegador fecha
  secure: Rails.env.production? # Somente HTTPS em produção