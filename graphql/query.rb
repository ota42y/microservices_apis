# frozen_string_literal: true

require 'graphql'
require_relative 'types'

class QueryType < GraphQL::Schema::Object
  field :applications, [Types::Application], null: false do
    description 'Get all applications'
  end

  def applications
    [
      { id: 1 },
      { id: 2, description: 'id=2 application' }
    ]
  end

  field :player, Types::Player, null: false do
    argument :id, Integer, required: true
  end

  def player(id:)
    {
      1 => { id: 1, name: 'Honoka' },
      2 => { id: 2, name: 'Mari' }
    }.fetch(id)
  end
end
