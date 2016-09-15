class SongsWorker
  include Sidekiq::Worker
 
  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      tmp = Artist.find_or_create_by(name:song[1])
      Song.create(title: song[0],artist:tmp)
    end
  end
end
