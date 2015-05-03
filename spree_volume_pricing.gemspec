Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_volume_pricing'
  s.version     = '3.3.0'
  s.summary     = 'Allow prices to be configured in quantity ranges for each variant'
  s.description = s.summary
  s.required_ruby_version = '>= 1.9.3'

  s.author       = 'Sean Schofield'
  s.email        = 'sean@railsdog.com'
  s.homepage     = 'https://github.com/spree-contrib/spree_volume_pricing'
  s.license      = 'BSD-3'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '~> 2.4.0.beta')

  s.add_development_dependency('sqlite3')
  s.add_development_dependency('capybara', '~> 1.1')
  s.add_development_dependency('ffaker')
  s.add_development_dependency('shoulda-matchers')
  s.add_development_dependency('rspec-rails', '~> 2.11')
  s.add_development_dependency 'simplecov'
  s.add_development_dependency('factory_girl_rails', '~> 4.3.0')
  s.add_development_dependency 'pry'
end
