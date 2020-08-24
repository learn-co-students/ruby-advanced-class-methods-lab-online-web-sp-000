class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find do |value|
      value.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if not self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{|value| value.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    seperate = filename.split("-")
    seperate_song = seperate[1].split(".")
    song.artist_name = seperate[0].strip
    song.name = seperate_song[0].strip
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    @@all << song
    seperate = filename.split("-")
    seperate_song = seperate[1].split(".")
    song.artist_name = seperate[0].strip
    song.name = seperate_song[0].strip
    song
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
