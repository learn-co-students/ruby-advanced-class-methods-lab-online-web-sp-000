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
    song.class.all << song
    song
  end

  def self.new_by_name (name)
    song = Song.new
    song.name = name
    song
  end
  def self.create_by_name (name)
    song = Song.new
    song.name = name
    song.class.all << song
    song
  end
  def self.find_by_name (name)
    @@all.detect {|song| song.name == name}
  end
  def self.find_or_create_by_name (name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  def self.alphabetical
    @@all.sort {|a, b| a.name <=> b.name}
  end
  def self.new_from_filename (filename)
    fn_no_extension = filename.split(".mp3")
    artist_song_array = fn_no_extension.join.split(" - ")
    song = Song.new
    song.name = artist_song_array[1]
    song.artist_name = artist_song_array[0]
    song
  end
  def self.create_from_filename (filename)
    @@all << self.new_from_filename(filename)
  end
  def self.destroy_all
    self.all.clear
  end
end
