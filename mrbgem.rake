require_relative 'mrblib/rubicon/version'

spec = MRuby::Gem::Specification.new('rubicon') do |spec|
  spec.bins    = ['rubicon']
  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
end

spec.license = 'MIT'
spec.author  = 'MRuby Developer'
spec.summary = 'rubicon'
spec.version = Rubicon::VERSION
