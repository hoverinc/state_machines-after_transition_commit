require_relative 'lib/state_machines/after_transition_commit/version'

Gem::Specification.new do |spec|
  spec.name          = "state_machines-after_transition_commit"
  spec.version       = StateMachines::AfterTransitionCommit::VERSION
  spec.authors       = ["Matt Fong"]
  spec.email         = ["matthewjf@gmail.com"]

  spec.summary       = %q{exposes state machine method to run code after a transition is committed to the database}
  spec.description   = %q{exposes state machine method to run code after a transition is committed to the database}
  spec.homepage      = "https://github.com/hoverinc/state_machines-after_transition_commit"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hoverinc/state_machines-after_transition_commit"
  spec.metadata["changelog_uri"] = "https://github.com/hoverinc/state_machines-after_transition_commit"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "factory_bot"
  spec.add_development_dependency "ffaker"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activesupport", ">= 5.2", "< 8.0"
  spec.add_development_dependency "pg", ">= 1.1"

  spec.add_runtime_dependency "activerecord", ">= 5.2", "< 8.0"
  spec.add_runtime_dependency "state_machines-activerecord", ">= 0.6.0", "< 1"
end
