require_relative 'mrblib/rubicon/version'

spec = MRuby::Gem::Specification.new('rubicon') do |spec|
  spec.bins    = ['rubicon']
  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
  spec.add_dependency 'mruby-json', :mgem => 'mruby-json'
  spec.add_dependency 'mruby-httprequest', :github => 'matsumoto-r/mruby-httprequest'
  spec.add_dependency 'mruby-socket', :github => 'take-cheeze/mruby-socket', checksum_hash: '7b4978b639e9b73296f5ced39dbcb722bf42cd0d' # https://github.com/iij/mruby-socket/issues/36
  spec.add_dependency 'mruby-io', :github => 'iij/mruby-io'
  spec.add_dependency 'mruby-dir', :github => 'iij/mruby-dir'
  spec.add_dependency 'mruby-erb', :github => 'jbreeden/mruby-erb'
  spec.add_dependency 'mruby-regexp-pcre', :mgem => 'mruby-regexp-pcre'
  spec.add_dependency 'mruby-eval', :core => 'mruby-eval'
  spec.add_dependency 'mruby-hash-ext', :core => 'mruby-hash-ext'
  spec.add_dependency 'mruby-proc-ext', :core => 'mruby-proc-ext'
  # spec.add_dependency 'mruby-fiber', :core => 'mruby-fiber'
  spec.add_dependency 'mruby-enumerator', :core => 'mruby-enumerator'
end

spec.license = 'MIT'
spec.author  = 'MRuby Developer'
spec.summary = 'rubicon'
spec.version = Rubicon::VERSION
