# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rinterface}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Bryson"]
  s.date = %q{2009-09-20}
  s.description = %q{Pure Ruby client that can send RPC calls to an Erlang node}
  s.email = %q{r@interf.ace}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    ".gitignore",
     "README.textile",
     "Rakefile",
     "VERSION",
     "examples/client.rb",
     "examples/math_server.erl",
     "lib/erlang/epmd.rb",
     "lib/erlang/external_format.rb",
     "lib/erlang/node.rb",
     "lib/rinterface.rb",
     "rinterface.gemspec",
     "spec/rinterface_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/davebryson/rinterface}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Erlang RPC Ruby Client}
  s.test_files = [
    "spec/rinterface_spec.rb",
     "spec/spec_helper.rb",
     "examples/client.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
