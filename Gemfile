source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.7"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 2.0"

# Use the Puma web server
gem "puma", "~> 6.4"

# Use SCSS for stylesheets
# gem "sassc", "~> 2.4"

# Use JavaScript with ESM import maps
gem "importmap-rails", "~> 2.0"

# Hotwire's SPA-like page accelerator
gem "turbo-rails", "~> 2.0"

# Hotwire's modest JavaScript framework
gem "stimulus-rails", "~> 1.3"

# Build JSON APIs with ease
gem "jbuilder", "~> 2.12"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 5.0"

# Use Active Model has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants
# gem "image_processing", "~> 1.12"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
end

group :development do
  # Use console on exceptions pages
  gem "web-console"

  # Add speed badges to your Rails application
  # gem "spring"
end

group :test do
  # Use system testing
  gem "capybara"
  gem "selenium-webdriver"
end

# Adicionar Devise para autenticação (opcional, para o botão "Entrar")
gem "devise", "~> 4.9"

gem "propshaft"

gem "fastimage", "~> 2.3"
