# frozen_string_literal: true

require 'graphql'
require_relative 'query'

class Schema < GraphQL::Schema
  query QueryType
end
