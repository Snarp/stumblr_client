# encoding: utf-8
require File.join(File.dirname(__FILE__), 'lib/tumblr/version')

Gem::Specification.new do |gem|
  gem.add_dependency 'faraday', '~> 1.0'
  gem.add_dependency 'faraday_middleware', '~> 1.0'
  gem.add_dependency 'json'
  gem.add_dependency 'simple_oauth'
  gem.add_dependency 'oauth'
  gem.add_dependency 'mime-types'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'simplecov'
  gem.authors = ['snarp', 'John Bunting', 'John Crepezzi']
  gem.description = %q{A Ruby wrapper for the Tumblr v2 API - fork by snarp}
  gem.email = ['snarp@snarp.work', 'codingjester@gmail.com', 'john@crepezzi.com']
  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files = `git ls-files`.split("\n")
  gem.homepage = "https://github.com/Snarp/stumblr_client"
  gem.license = "Apache"
  gem.name = "stumblr_client"
  gem.require_paths = ["lib"]
  gem.summary = %q{Tumblr API wrapper - fork by snarp}
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version = Tumblr::VERSION
end
