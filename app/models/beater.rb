class Beater < ApplicationRecord
  enum provider: %i[heroku]
  
  validates_format_of :url, with: URI::regexp(%w(http https))
end
