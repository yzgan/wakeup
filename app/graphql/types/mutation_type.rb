module Types
  class MutationType < Types::BaseObject
    field :createBeater, mutation: Mutations::CreateBeater
    # TODO: remove me
    # field :name, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end
  end
end
