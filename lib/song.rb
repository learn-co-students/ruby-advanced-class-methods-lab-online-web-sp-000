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
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
  song = self.find_by_name(name)
    if song
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    alpha_array = @@all.sort_by {|a| a.name}
    alpha_array
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    array[1].slice! ".mp3"
    song = self.new
    song.name = array[1]
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end
