module Types
  class QueryType < Types::BaseObject
    field :beaters, [Types::BeaterType], null: false

    def beaters
      Beater.all
    end
  end
end
