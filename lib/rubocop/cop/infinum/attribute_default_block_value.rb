# frozen_string_literal: true

require 'rubocop'

module RuboCop
  module Cop
    module Infinum
      # This cop looks for `attribute` class methods that specify a `:default` option
      # and pass it a method without a block.
      #
      # @example
      #   # bad
      #   class User < ApplicationRecord
      #     attribute :confirmed_at, :datetime, default: Time.zone.now
      #   end
      #
      #   # good
      #   class User < ActiveRecord::Base
      #     attribute :confirmed_at, :datetime, default: -> { Time.zone.now }
      #   end
      class AttributeDefaultBlockValue < ::RuboCop::Cop::Base
        extend AutoCorrector

        MSG = 'Pass method in a block to `:default` option.'

        def_node_matcher :default_attribute, <<~PATTERN
          (send nil? :attribute _ ?_ (hash <$#attribute ...>))
        PATTERN

        def_node_matcher :attribute, '(pair (sym :default) $_)'

        def on_send(node)
          default_attribute(node) do |hash_pair|
            target_node = attribute(hash_pair)
            return unless target_node.send_type?

            add_offense(target_node, message: MSG) do |corrector|
              expression = attribute(default_attribute(node))

              corrector.replace(target_node, "-> { #{expression.source} }")
            end
          end
        end
      end
    end
  end
end
