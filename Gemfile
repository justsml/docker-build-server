source 'http://rubygems.org'
gem 'rails', '~>4.1.1'
gem 'sass-rails', '4.0.4' # https://github.com/rails/sass-rails/issues/191
gem 'coffee-rails', '~>4.1.0'
gem 'uglifier', '>=1.3'

gem 'rake', '~> 10.4.2'

gem 'oj', '~> 2.13.0'
gem 'multi_json', '>=1.3.x'

gem 'mongoid', '>= 4.0.0.rc2'
gem 'mongoid_paranoia', github: 'simi/mongoid_paranoia'
# gem 'pg', '~> 0.17.1'

gem 'devise', '~> 3.3.0' # https://github.com/codahale/bcrypt-ruby/issues/89
gem 'cancancan', '~> 1.12.0'

gem 'quick_magick', '~> 0.8.0'
gem 'mongoid-paperclip', '~> 0.0.10', :require => "mongoid_paperclip"
gem 'aws-sdk', '~> 1.66.0'
gem 'prawn', '1.0.0'
gem 'prawn-fast-png'
gem 'paperclip-ffmpeg', '~> 1.2.0'
gem 'fastimage', require: false

gem 'twitter', '~> 5.15.0'
gem 'instagram', '~> 1.1.6'
gem 'koala', '~> 2.2.0'
gem 'omniauth-facebook', '~> 2.0.1'
gem 'omniauth-instagram', '~> 1.0.1'

gem 'airbrake', '~> 4.0.0' # https://github.com/airbrake/airbrake/issues/313
gem 'hipchat', '~> 1.5.2'
gem 'okcomputer', '~> 0.7.5'

gem 'schlepp', :git => 'git://github.com/lyleunderwood/schlepp.git', :tag => '0.2.0', :require => false
# gem 'termios', git: 'git://github.com/edison/ruby-termios.git'

gem 'rufus-mnemo', '~> 1.2.3'

gem 'state_machine', '~> 1.2.0', :git => 'git://github.com/aganov/state_machine.git'

gem 'rack-cors', '~> 0.4.0', :require => 'rack/cors'

gem 'rubyzip', '~> 1.1.7'

gem 'dalli', '~> 2.7.4'
gem 'elasticsearch', '~> 1.0.4'
gem 'sidekiq', '~> 3.5.3'
gem 'typhoeus', '~> 0.7.3'

gem 'activeadmin', github: 'activeadmin/active_admin', :ref => 'ad4caab46f1813bedf5acdb7739a17da546a5609'
gem 'activeadmin-mongoid', github: 'fred/activeadmin-mongoid', branch: 'activeadmin-1.0' # https://github.com/elia/activeadmin-mongoid/issues/79
gem 'active_skin', '~> 0.0.9'
gem 'chartkick', '~> 1.4.1'
gem 'nested_form', '~> 0.3.2'
gem 'chosen-rails', '~> 1.4.1'

gem 'nested_form_ui', '~> 0.0.1'
gem 'jquery-ui-rails', '~> 5.0.5'

gem 'newrelic_rpm', '~> 3.14.0'
gem 'simplecov', '~> 0.10.0', :require => false, :group => :test
gem 'ox', '~> 2.2.1', :require => false
gem 'axlsx', '~> 1.3.6', :require => false
gem 'zip-zip', :require => false # https://github.com/randym/axlsx/issues/234

gem 'tracking_number', '~> 0.10.1'

# Gems needed by particular clients
gem 'net-sftp', '~> 2.1.2', :require => false # tnf
gem 'activerecord-import', '~>0.4.0', :require => false # spyder
gem 'savon', '~> 2.11.1', :require => false # oakley
gem 'writeexcel', :require => false # orage
gem 'htmlentities', :require => false # royal_robbins

group :production, :staging do
  gem 'ey_config', '~> 0.0.7'
end

group :staging do
  gem 'unicorn', '~> 4.8.3'
end

group :development, :test do
  gem 'engineyard', '~> 2.3.3'
  # gem 'rb-fsevent'
  gem 'github_api', '~> 0.12.4', :require => false
  gem 'ruby-prof', '~> 0.15.9', :require => false
  gem 'pry-rails', '~> 0.3.4'
  gem 'pry-byebug', '~> 3.0.1'
  gem 'letter_opener', '~> 1.4.1'
  gem 'rspec-rails', '~> 3.3.3'
  gem 'test_notifier', '~> 2.0.3'
  gem 'fabrication', '~> 2.14.1'
  #gem 'mongoid-rspec' # not compatible with mongoid 4.x yet
  gem 'notifier', '~> 0.5.1'
  gem 'faker', '~> 1.5.0'
  gem 'capybara', '~> 2.3.0'
  gem 'poltergeist', '~> 1.6.0'
  gem 'selenium-webdriver', '~> 2.47.1'
  gem 'database_cleaner', '~> 1.5.0'
  gem 'spring-commands-rspec', '~> 1.0.4'
  gem 'guard', '~> 2.13.0'
  gem 'guard-rspec', '~> 4.6.4'
  gem 'growl', '~> 1.0.3'
  gem 'pdf-reader', '~> 1.3.3'
end
