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
    self.name
    song = self.new  
    self.all << song
    song
  end
  
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end
  
  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end
  
  def self.find_by_name(title)
    self.all.detect{|s| s.name == title}
  end 
  
  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end 
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
 
  def self.new_from_filename(filename)
    split_array = filename.split(" - ")
    artist_name = split_array[0]
    song_name = split_array[1].gsub(".mp3", "")
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end   
end


