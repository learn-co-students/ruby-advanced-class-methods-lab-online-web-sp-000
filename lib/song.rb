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
    new_song = Song.new 
    new_song.save
    new_song 
  end 
  
  def self.new_by_name(name)
   new_song = Song.new 
   new_song.name = name 
   new_song 
  end
  
  def self.create_by_name(name)
    new_song = Song.new 
    new_song.name = name 
    new_song.save
    new_song 
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil  
      self.create_by_name(name)
    else 
      self.find_by_name(name)
    end 
  end 
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(name)
    song_split = name.split("-")
    artist = song_split[0].strip
    new_name = song_split[1].delete_suffix(".mp3").strip
    
    new_song = Song.new 
    new_song.name = new_name 
    new_song.artist_name = artist 
    new_song 
  end 

  def self.create_from_filename(name)
    song_split = name.split("-")
    artist = song_split[0].strip
    new_name = song_split[1].delete_suffix(".mp3").strip
    
    new_song = self.create_by_name(new_name)
    new_song.artist_name = artist 
  end 
  
  def self.destroy_all
    self.all.clear
  end 
end
