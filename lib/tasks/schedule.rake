namespace :schedule do
  desc "Create Ping jobs to Beaters"
  task ping_all: :environment do
    Beater.ids.each do |id|
      BeatWorker.perform_async id
    end
  end
end
