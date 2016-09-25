class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      Artist.find_or_create_by(name: song[1]).songs.build(title: song[0]).tap(&:save)
    end
  end
end
