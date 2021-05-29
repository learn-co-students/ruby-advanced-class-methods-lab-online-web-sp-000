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
    @@all << song
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
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else Song.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by do |songs|
      songs.name
    end
  end
  
  def self.new_from_filename(file)
    new_file = file.split(" - ")
    name = new_file[1].chomp(".mp3")
    artist_name = new_file[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(file)
    @@all << Song.new_from_filename(file)
  end
  
  def self.destroy_all
    @@all.clear
    
  end
end
