# Copied from rspec-rails spec/support/matchers.rb
module MatchesForRSpecRailsSpecs
  extend RSpec::Matchers::DSL

  matcher :be_included_in_files_in do |path|
    match do |mod|
      stub_metadata(
        :file_path => "#{path}whatever_spec.rb:15"
      )
      group = RSpec::Core::ExampleGroup.describe
      group.included_modules.include?(mod)
    end
  end
end