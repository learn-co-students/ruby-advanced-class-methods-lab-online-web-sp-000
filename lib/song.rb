class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
      new_song = self.create
      new_song.name = name
      new_song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song = self.create_by_name(name) if song == nil
    song
  end

  def self.alphabetical
    self.all.sort { |song1, song2| song1.name <=> song2.name }
  end

  def self.new_from_filename(filename)
    song_data = filename[0..-5].split(" - ")
    song = self.new_by_name(song_data[1])
    song.artist_name = song_data[0]
    song
  end

  def self.create_from_filename(filename)
    song_data = filename[0..-5].split(" - ")
    song = self.create_by_name(song_data[1])
    song.artist_name = song_data[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
