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
gem 'redis-rack-cache', '~> 2.0', '>= 2.0.1'
gem 'sidekiq', '~> 5.0', '>= 5.0.5'
gem 'bootsnap', require: false

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet', '~> 5.6', '>= 5.6.1'
  gem 'meta_request', '~> 0.4.3'
  gem 'rubocop', '~> 0.51.0'
  gem 'faker', '~> 1.8', '>= 1.8.4'
  gem 'rack-mini-profiler', '~> 0.10.7'
end

group :production do
  gem 'puma', '~> 3.11'
end
