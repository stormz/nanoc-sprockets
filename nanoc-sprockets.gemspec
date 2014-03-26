# -*- coding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'nanoc-sprockets'
  s.version     = '0.0.2'
  s.summary     = 'Use sprockets as a datasource for nanoc.'
  s.description = 'Use sprockets as a datasource for nanoc.'
  s.homepage    = 'https://github.com/stormz/nanoc-sprockets'
  s.license     = 'MIT'

  s.authors     = ["François de Metz"]
  s.email       = 'francois@2metz.fr'

  s.require_paths = ["lib"]
  s.files       = `git ls-files`.split($\)

  s.add_dependency "sprockets", ">= 2.0.0"
  s.add_dependency "sprockets-helpers", ">= 1.1.0"
end
