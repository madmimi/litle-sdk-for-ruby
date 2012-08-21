# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name                  = "LitleOnline"
  gem.authors               = ["Litle & Co"]
  gem.email                 = ["sdksupport@litle.com"]
  gem.description           = File.read(File.join(File.dirname(__FILE__), 'DESCRIPTION'))
  gem.summary               = %q{Ruby SDK produced by Litle & Co. for online transaction processing using Litle XML format}
  gem.homepage              = "http://www.litle.com/developers"
  gem.requirements          = ['Contact sdksupport@litle.com for more information']
  gem.files                 = `git ls-files`.split($\)
  gem.executables           = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files            = Dir["test/unit/ts_unit.rb"]
  gem.require_paths         = ["lib"]
  gem.version               = "8.13.2"
  gem.required_ruby_version = '>=1.8.6'
  gem.platform              = Gem::Platform::RUBY
  gem.has_rdoc              = true
  gem.add_dependency('xml-object')
  gem.add_dependency('xml-mapping')
  gem.add_development_dependency('mocha')
end
