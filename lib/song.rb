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
    create_self = self.new
    create_self.save
    create_self
  end
   
   def self.new_by_name(new_song)
     song = self.new
     song.name = new_song
     song
    end

  def self.create_by_name(song)
    new_song = self.new
    new_song.name = song
    @@all << new_song
    new_song
  end
 
  def self.find_by_name(name)
    @@all.find {|n| n.name == name}
  end
  
  def self.alphabetical
    @@all.sort_by {|a, b| a <=> b}
  end
  
  def self.destroy_all
    self.all.clear
  end
end
