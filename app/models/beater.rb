class Beater < ApplicationRecord
  include HTTParty
  open_timeout 5 # default 10
  read_timeout 5 # default 10

  # StatusChannel.broadcast_to beater.user, beater
  belongs_to :user

  enum provider: %i[heroku]
  enum status: %i[offline online]
  
  validates :status, presence: true
  validates_format_of :url, with: URI::regexp(%w(http https))
  validates :url, uniqueness: true, presence: true

  after_update_commit :update_client_status, if: :saved_change_to_status?

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

  def update_client_status
    StatusChannel.broadcast_to user, self
  end
end
