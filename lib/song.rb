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
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by do |song_object|
      song_object.name
    end
  end
  
  def self.new_from_filename(filename)
    file = filename.split(".")
    file.pop
    name_artist = file.join.split(" - ")
    song = self.new
    song.name = name_artist[1]
    song.artist_name = name_artist[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end

end
