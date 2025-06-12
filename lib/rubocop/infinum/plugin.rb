# frozen_string_literal: true

require 'rubocop/infinum/version'
require 'lint_roller'

module RuboCop
  module Infinum
    # The main plugin class for RuboCop Infinum.
    class Plugin < LintRoller::Plugin
      def about
        LintRoller::About.new(
          name: 'rubocop-infinum',
          version: VERSION,
          homepage: 'https://github.com/infinum/rubocop-infinum',
          description: 'This plugin provides the RuboCop configuration file ' \
                       'alongside some custom cops used at Infinum.'
        )
      end

      def supported?(context)
        context.engine == :rubocop
      end

      def rules(_context)
        LintRoller::Rules.new(
          type: :path,
          config_format: :rubocop,
          value: Pathname.new(__dir__).join('../../../rubocop.yml')
        )
      end
    end
  end
end
