class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      Customer.create(artist_name: song[0], title: song[1])
    end
  end
end
