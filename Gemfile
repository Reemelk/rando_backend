source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.21.0'
gem 'jwt', '~> 2.0'
gem 'oj', git: 'https://github.com/ohler55/oj', branch: :master
gem 'oj_mimic_json', '~> 1.0', '>= 1.0.1'
gem 'bcrypt', '~> 3.1', '>= 3.1.11'
gem 'rack-cors', '~> 1.0', '>= 1.0.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet', '~> 5.6', '>= 5.6.1'
  gem 'meta_request', '~> 0.4.3'
  gem 'rubocop', '~> 0.50.0'
  gem 'faker', '~> 1.8', '>= 1.8.4'
end

group :production do
  gem 'puma', '~> 3.10'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
