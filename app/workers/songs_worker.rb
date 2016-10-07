class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers:true) do |song|
      artist = Artist.find_or_create_by(name: song[1])
      Song.create(title: song[0], artist_id: artist.id)
    end
  end
end


class LeadsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(leads_file)
    CSV.foreach(leads_file, headers: true) do |lead|
      Customer.create(email: lead[0], first_name: lead[1], last_name: lead[2])
    end

  end
end
