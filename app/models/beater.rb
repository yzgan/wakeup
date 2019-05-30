class Beater < ApplicationRecord
  include HTTParty
  open_timeout 5 # default 10
  read_timeout 5 # default 10

  enum provider: %i[heroku]
  enum status: %i[offline online]
  
  validates :status, presence: true
  validates_format_of :url, with: URI::regexp(%w(http https))

  def ping
    status = :offline
    status = :online if ping_success?
  ensure
    update(status: status)
  end

  private

  def ping_success?
    self.class.get(url).code == 200
  end
end
