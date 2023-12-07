# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use sqlite3 as the database for Active Record

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem 'pg', '~> 1.4'

gem 'rspec-rails', '~> 6.0', group: :test

gem 'guard', '~> 2.18', group: :development
gem 'guard-livereload', '~> 2.5', group: :development
gem 'guard-rspec', '~> 4.7', group: :development

gem 'guard-rails', '~> 0.8.1', group: :development

gem 'tailwindcss-rails', '~> 2.0'

gem 'view_component', '~> 2.76'

gem 'dry-struct', '~> 1.6'

gem 'heroicon', '~> 1.0'

gem 'devise', '~> 4.8'

gem 'capistrano3-puma', '~> 5.2', group: :development
gem 'capistrano-rails', '~> 1.6', group: :development, require: false
gem 'capistrano-rbenv', '~> 2.2', group: :development
gem 'nokogiri', '>= 1.13.10' # brakeman: CVE-2022-23476
gem 'rails-html-sanitizer', '>= 1.4.4' # brakeman: CVE-2022-23519, CVE-2022-23518, CVE-2022-23517, and more

gem 'lograge', '~> 0.12.0'

gem 'rubocop-rails', '~> 2.17', group: :development

gem 'rubocop-rspec', '~> 2.15', group: :development

gem 'dry-types', '~> 1.7'

gem 'brakeman', '~> 5.4', group: :development

gem 'bundler-audit', '~> 0.9.1', group: :development

gem 'pundit', '~> 2.2'

gem 'fasterer', '~> 0.10.0', group: :development

gem 'capybara', '~> 3.38', group: :test

gem "selenium-webdriver", "~> 4.7", :group => :test