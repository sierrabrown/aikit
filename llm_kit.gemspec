require_relative "lib/llm_kit/version"

Gem::Specification.new do |spec|
  spec.name        = "llm_kit"
  spec.version     = LlmKit::VERSION
  spec.authors     = [ "Sierra Brown" ]
  spec.email       = [ "sierradionnebrown@gmail.com" ]
  spec.homepage    = "https://github.com/sierradionnebrown/llm_kit"
  spec.summary     = "A toolkit for building LLM-powered applications."
  spec.description = "A toolkit for building LLM-powered applications."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sierradionnebrown/llm_kit"
  spec.metadata["changelog_uri"] = "https://github.com/sierradionnebrown/llm_kit/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.0.2"
  spec.add_development_dependency "rspec"
end
