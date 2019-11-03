class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
   @@all << self
  end
  
  def Song.create
    song = Song.new
    song.save
    song
  end

  def Song.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def Song.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def Song.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end

  def Song.find_or_create_by_name(song_name)
    Song.find_by_name(song_name) || Song.create_by_name(song_name)
  end

  def Song.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def Song.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def Song.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
    #@@all.clear
  end

end
  


