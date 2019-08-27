require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize
    
  end

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
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    #if self.find_by_name(name)
      #self.find_by_name(name)
    #else
      #self.create_by_name(name)
    #end
    
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end
  
  def self.new_from_filename(filename)
    song = self.new
    new_filename = filename.chomp(".mp3").split(" - ")
    song.artist_name = new_filename[0]
    song.name = new_filename[1]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new
    create_filename = filename.chomp(".mp3").split(" - ")
    song.artist_name = create_filename[0]
    song.name = create_filename[1]
    song.save
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
