source('https://rubygems.org')

gem('sinatra-contrib', :require => 'sinatra/reloader')
gem('sinatra-activerecord')
gem('rake')
gem('pg')


group(:test) do
  gem('rspec')
  gem('pry')
  gem('capybara', :require => 'capybara/rspec')
  gem ('shoulda-matchers')
end

group(:production) do
  gem('sinatra')
end
