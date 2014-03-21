require 'rspec/core'
require 'ammeter/rspec/generator/example/generator_example_group'

RSpec::configure do |c|
  def c.escaped_path(*parts)
    Regexp.compile(parts.join('[\\\/]') + '[\\\/]')
  end

  generator_path_regex = c.escaped_path(%w[spec generators])
  c.include Ammeter::RSpec::Rails::GeneratorExampleGroup,
    :type          => :generator,
    :file_path     => lambda { |file_path, metadata|
      metadata[:type].nil? && generator_path_regex =~ file_path
    }
end
