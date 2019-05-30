class BeatWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, backtrace: true # optimal to disable backtrace for large number of retries

  def perform(id)
    Beater.find(id).ping
  end
end
