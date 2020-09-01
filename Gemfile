source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'bcrypt', '~> 3.1', '>= 3.1.15'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'jwt', '~> 2.2', '>= 2.2.2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.13'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'pry', '~> 0.13.1'
  gem 'rubocop', '~> 0.89.1'
  gem 'rubocop-rspec', '~> 1.43', '>= 1.43.1'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner-active_record', '~> 1.8'
  gem 'shoulda-matchers', '~> 4.3'
  gem 'simplecov', '~> 0.19.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# might need some of these later...
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# gem 'jwt', '~> 2.2', '>= 2.2.1'
# gem 'cloudinary', '~> 1.14'
# gem 'rack-cors', '~> 1.1', '>= 1.1.1'
# gem 'active_model_serializers', '~> 0.10.10'
