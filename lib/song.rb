require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new 
    song.save
    song
  end 
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end 
  
  def self.create_by_name(song_name)
    song = self.create 
    song.name = song_name
    song
  end 
  
  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end 
  end 
  
  def self.find_or_create_by_name(name_str)
    find_by_name(name_str) || create_by_name(name_str)
  end 
  
  def self.alphabetical
    @@all.sort_by do |song| 
      song.name
    end 
  end 
  
  def self.new_from_filename(str)
    str_format = str.split(".")[-1]
    if str_format == "mp3"
      song = self.new 
      song.artist_name = str.split("-")[0].strip
      song.name = str.split("-")[1].chomp(".mp3").strip
      song.save
      song 
      # binding.pry
    end 
  end 
  
  def self.create_from_filename(str)
    str_format = str.split(".")[-1]
    if str_format == "mp3"
      song = self.create
      song.artist_name = str.split("-")[0].strip
      song.name = str.split("-")[1].chomp(".mp3").strip
      song 
      # binding.pry
    end 
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.destroy_all
    @@all.clear
  end 

end
