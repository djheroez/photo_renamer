require_relative 'lib/photo_renamer/version'

Gem::Specification.new do |spec|
  spec.name          = "photo_renamer"
  spec.version       = PhotoRenamer::VERSION
  spec.authors       = ["Dennis Hernandez"]
  spec.email         = ["djheroez@gmail.com"]

  spec.summary       = %q{Photo renamer}
  spec.description   = %q{Gem to rename photos}
  spec.homepage      = "http://github.com/djheroez/photo_renamer"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
