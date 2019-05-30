class Beater < ApplicationRecord
  enum provider: %i[heroku]
  enum status: %i[offline online]
  
  validates :status, presence: true
  validates_format_of :url, with: URI::regexp(%w(http https))
end
