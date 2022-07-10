# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','todo','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'todo'
  s.version = Todo::VERSION
  s.author = 'Collin J'
  s.email = 'email@notreal.com'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A lightweight task-management app'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.extra_rdoc_files = ['README.rdoc','todo.rdoc']
  s.rdoc_options << '--title' << 'todo' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'todo'
  s.add_development_dependency('rake','~> 10.1.0')
  s.add_development_dependency('rdoc', '~> 4.3')
  s.add_development_dependency('minitest', '~> 5.14')
  s.add_development_dependency('aruba', '~> 2.1')
  s.add_development_dependency('mocha', '~> 1.14')
  s.add_runtime_dependency('gli','~> 2.21.0')
end
