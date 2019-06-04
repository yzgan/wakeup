module Mutations
  class CreateBeater < BaseMutation
    argument :name, String, required: true
    argument :provider, Types::ProviderType, required: true
    argument :url, String, required: true
    argument :user_id, ID, required: true
    
    field :beater, Types::BeaterType, null: true
    field :errors, [String], null: false

    def resolve(name:, provider:, url:, user_id:)
      user = User.find(user_id)
      beater = user.beaters.new(name: name, provider: provider, url: url)
      if beater.save
        {
          beater: beater,
          errors: []
        }
      else
        {
          beater: nil,
          errors: beater.errors.full_messages
        }
      end
    end
  end
end
