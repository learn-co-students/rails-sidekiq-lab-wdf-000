class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform
    CSV.foreach(params["file"].path, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
    redirect_to songs_path
  end
end
