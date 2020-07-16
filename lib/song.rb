
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    created_song = self.new
    @@all << created_song
    created_song
  end

  def self.new_by_name(song_string_name)
    created_song = self.new
    created_song.name = song_string_name
    created_song  
  end

  def self.create_by_name(song_string_name)
    created_song = self.new
    created_song.name = song_string_name
    @@all << created_song
    created_song
  end

  def self.find_by_name(song_string_name)
    self.all.find{|song| song.name == song_string_name}
  end

  def self.find_or_create_by_name(created_song)
   self.find_by_name(created_song) || create_by_name(created_song)   
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    created_song = self.new
    created_song.name = filename.split(" - ")[1].split(".")[0]
    created_song.artist_name = filename.split(" - ")[0]
    created_song
  end

  def self.create_from_filename(filename)
    created_song = self.new
    created_song.name = filename.split(" - ")[1].split(".")[0]
    created_song.artist_name = filename.split(" - ")[0]
    created_song.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all = []
  end

end
