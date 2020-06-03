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
  
  def self.create_by_name(string)
    song = self.new
    song.name = string
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|s| s.name == name}

  end

def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil
    self.create_by_name(name)
  elsif self.find_by_name(name) != nil 
        self.find_by_name(name)
end
end

def self.alphabetical 
  self.all.sort_by {|song| song.name}
end

def self.new_from_filename(filename)
  new_str = filename.split(".").first
  words_array = new_str.split(" - ")
  new_song = self.new
  new_song.name = words_array[1]
  new_song.artist_name = words_array[0]
  new_song
end

def self.create_from_filename(filename)
  self.new_from_filename(filename)
  new_song = self.new 
  new_song.name = self.new_from_filename(filename).name 
  new_song.artist_name = self.new_from_filename(filename).artist_name
  new_song.save
end

def self.destroy_all 
  @@all.clear
end
end