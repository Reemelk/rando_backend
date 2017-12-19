source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1', '>= 5.1.4'
gem 'pg', '~> 0.21.0'
gem 'jwt', '~> 2.1'
gem 'oj', '~> 3.3', '>= 3.3.9'
gem 'oj_mimic_json', '~> 1.0', '>= 1.0.1'
gem 'bcrypt', '~> 3.1', '>= 3.1.11'
gem 'rack-cors', '~> 1.0', '>= 1.0.2'
gem 'redis', '~> 4.0', '>= 4.0.1'
gem 'redis-rails', '~> 5.0', '>= 5.0.2'
gem 'redis-namespace', '~> 1.6'
gem 'redis-rack-cache', '~> 2.0', '>= 2.0.2'
gem 'bootsnap', require: false
# gem 'sidekiq', '~> 5.0', '>= 5.0.5'

group :development do
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  gem 'bullet', '~> 5.7'
  gem 'meta_request', '~> 0.5.0'
  gem 'rubocop', '~> 0.52.0'
  gem 'faker', '~> 1.8', '>= 1.8.5'
  gem 'capistrano', '~> 3.10', '>= 3.10.1'
  gem 'capistrano-rails', '~> 1.3', '>= 1.3.1'
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
end

group :production do
  gem 'puma', '~> 3.11'
end
