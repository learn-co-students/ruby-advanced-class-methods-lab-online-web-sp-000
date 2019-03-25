require 'pry'
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
    self.all << song
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
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if !self.all.include?(name)  
      self.create_by_name(name)
    end
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    name = data[1].chomp(".mp3")
    song = Song.new
    song.artist_name = artist
    song.name = name
    song
  end
  
  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    name = data[1].chomp(".mp3")
    song = Song.new
    song.artist_name = artist
    song.name = name
    self.all << song
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
