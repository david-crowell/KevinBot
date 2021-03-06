Gem::Specification.new do |spec|
  spec.name          = "lita-kevinbot"
  spec.version       = "0.1"
  spec.date          = "2013-07-30"
  spec.authors       = ["Ben Wu","Edward Lovall"]
  spec.description   = %q{A Lita handler for KevinBot.}
  spec.summary       = %q{A Lita handler for KevinBot.}

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  
  spec.add_dependency "nokogiri" #web parsing
end
