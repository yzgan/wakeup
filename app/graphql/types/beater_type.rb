module Types
  class BeaterType < Types::BaseObject
    description 'List of beaters defined'

    field :id, ID, null: false
    field :name, String, null: true
    field :provider, ProviderType, null: false
    field :url, String, null: true
    field :status, StatusType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
