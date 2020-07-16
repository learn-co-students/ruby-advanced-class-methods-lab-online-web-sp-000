class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.detect {|song|return song if song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) or self.create_by_name(name)
  end

  def self.alphabetical
    Song.all.sort_by{|song|song.name}
  end

  def self.new_from_filename(file_name)
    new_song = file_name.split(" - ")
    artist = new_song[0]
    song_name = new_song[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
