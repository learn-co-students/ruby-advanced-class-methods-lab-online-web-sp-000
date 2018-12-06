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
    @@all << song
    song
  end
  
  def self.new_by_name(song_name, artist_name = nil)
    song = self.new 
    song.name = song_name
    song.artist_name = artist_name
    song 
  end
  
  def self.create_by_name(song_name, artist_name = nil)
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    @@all << song 
    song
  end
  
  def self.find_by_name(song)
    self.all.find{|x| x.name == song}
  end
  
  def self.find_or_create_by_name(song)
    if self.find_by_name(song) == nil 
      self.create_by_name(song)
    else 
      self.find_by_name(song)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|x| x.name}
  end
   
  def self.new_from_filename(filename)
    new_array = [ ]
    new_array = filename.split(/[-.]/).map!{|x| x.strip}
    artist = new_array[0]
    song_title = new_array[1]
    self.new_by_name(song_title, artist)
  end
  
  def self.create_from_filename(filename)
    new_array = [ ]
    new_array = filename.split(/[-.]/).map!{|x| x.strip}
    artist = new_array[0]
    song_title = new_array[1]
    self.create_by_name(song_title, artist)
  end 
  
  def self.destroy_all
    self.all.clear
  end
  
end
