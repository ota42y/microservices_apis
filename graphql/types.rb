# frozen_string_literal: true

module Types
  class Application < GraphQL::Schema::Object
    description "Application's Object Type"

    field :id, Integer, null: false
    field :description, String, null: true
  end

  class Player < GraphQL::Schema::Object
    field :id, Integer, null: false
    field :name, String, null: false
  end
end
