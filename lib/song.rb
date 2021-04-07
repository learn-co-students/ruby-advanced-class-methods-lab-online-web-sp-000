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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|this_song| this_song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    new_song = self.new
    new_song.name = filename.split(" - ")[1].split(".")[0]
    new_song.artist_name = filename.split(" - ")[0]
    new_song
  end

  def self.create_from_filename(filename)
      new_song = self.new
      new_song.name = filename.split(" - ")[1].split(".")[0]
      new_song.artist_name = filename.split(" - ")[0]
      new_song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
