source "https://rubygems.org"

ruby "3.0.3"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]
gem "bootsnap", require: false
gem "rack-cors"
gem 'rack-attack'
gem 'secure_headers'

# Graphql
gem 'graphql'

# Pagination
gem 'kaminari'
gem 'kaminari-api-meta-data', require: 'kaminari_api_meta_data'

gem "propshaft", "~> 1.1"
gem 'bundler-audit'

group :development, :test do
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
gem "sqlite3", "~> 1.4"
end

group :development do
  gem "graphiql-rails"
  gem "faker"
end

group :production do
  gem "pg"
end