# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payment-integration-cielo/version'

Gem::Specification.new do |spec|
  spec.name           = "payment-integration-cielo"
  spec.version        = PaymentIntegrationCielo::VERSION 
  spec.authors        = [ " Joao Luiz Peterli " ]
  spec.email          = [ " joao.luiz.peterli@gmail.com.br " ]

 
  spec.summary       =  %q{ Gem Responsável pela integração com cielo }
  spec.description   =  %q{ Esta é uma maneira de facilitar as transações com a API do cartão da cielo. }
  spec.homepage     =  ""

  spec.license           = 'MIT-CMU'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.13"
  spec.add_dependency "nokogiri", "~> 1.8", ">= 1.6.8"
  spec.add_dependency "rake", "~> 10.0"
  spec.add_dependency "uuidtools", "~> 2.1"
  spec.add_dependency "rspec", "~> 3.7"
end
