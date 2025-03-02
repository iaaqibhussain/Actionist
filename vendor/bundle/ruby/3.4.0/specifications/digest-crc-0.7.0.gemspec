# -*- encoding: utf-8 -*-
# stub: digest-crc 0.7.0 ruby ext lib
# stub: ext/digest/Rakefile

Gem::Specification.new do |s|
  s.name = "digest-crc".freeze
  s.version = "0.7.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/postmodern/digest-crc/issues", "changelog_uri" => "https://github.com/postmodern/digest-crc/blob/master/ChangeLog.md", "documentation_uri" => "https://rubydoc.info/gems/digest-crc", "source_code_uri" => "https://github.com/postmodern/digest-crc" } if s.respond_to? :metadata=
  s.require_paths = ["ext".freeze, "lib".freeze]
  s.authors = ["Postmodern".freeze]
  s.date = "2025-01-28"
  s.description = "Adds support for calculating Cyclic Redundancy Check (CRC) to the Digest module.".freeze
  s.email = "postmodern.mod3@gmail.com".freeze
  s.extensions = ["ext/digest/Rakefile".freeze]
  s.extra_rdoc_files = ["ChangeLog.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["ChangeLog.md".freeze, "LICENSE.txt".freeze, "README.md".freeze, "ext/digest/Rakefile".freeze]
  s.homepage = "https://github.com/postmodern/digest-crc#readme".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.22".freeze
  s.summary = "A Cyclic Redundancy Check (CRC) library for Ruby.".freeze

  s.installed_by_version = "3.6.3".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rake>.freeze, [">= 12.0.0".freeze, "< 14.0.0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0".freeze])
end
