class SongsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      Song.create(title: song[0], aritst_name: song[1])
    end
  end
end