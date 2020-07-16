class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name }
  end

  def self.new_from_filename(filename)
    filename = filename.chomp(".mp3").split(" - ")
    song = self.new_by_name(filename[1])
    song.artist_name = filename[0]
    song
  end

  def self.create_from_filename(filename)
    filename = filename.chomp(".mp3").split(" - ")
    song = self.create_by_name(filename[1])
    song.artist_name = filename[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
