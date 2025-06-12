# frozen_string_literal: true

require 'rubocop-infinum'
require 'rubocop/rspec/support'
require 'pry-byebug'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.raise_errors_for_deprecations!

  config.order = :random
  Kernel.srand(config.seed)
end
