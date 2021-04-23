# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 2.7.2"

gem "rails", "~> 6.1.1"

gem "devise"
gem "redcarpet"
gem "simple_form"
gem "slim-rails"
gem "cocoon"
gem "octicons_helper"
gem "judge0"
gem "view_component_reflex", "~> 3.1.3"
gem "noticed"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.12"
gem "sass-rails", "~> 5"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "redis", "~> 4.0", require: ["redis", "redis/connection/hiredis"]
gem "hiredis"
gem "textacular", "~> 5.0"
gem "will_paginate", "~> 3.1.0"
gem "friendly_id", "~> 5.1.0"
gem "rack-mini-profiler"

gem "bootsnap", "~> 1.6.0", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "standard"
  gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "master"
  gem "simplecov", require: false, group: :test
  gem "shoulda-context"
  gem "vcr"
  gem "webmock"
  gem "uri_miner"
  gem "kramdown"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "solargraph"
  gem "guard"
  gem "rack-livereload"
  gem "guard-livereload", require: false
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "hotwire-rails", "~> 0.1.3"
