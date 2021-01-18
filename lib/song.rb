require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  
def self.create
  new_song = Song.new 
  new_song.save 
  #to call the save method down below 
  new_song 
  #to return the new song per the test  
end  
 
 
def self.new_by_name(name)
new_song = self.new
    #we are using new_song instead of Song because we earlier changed the value to new_song 
new_song.name = name 
    #we are passing in the argument  
new_song
end

def self.create_by_name(name)
  new_song = self.new
  new_song.name = name
  new_song.save 
    new_song
end 


  def self.all
    @@all
  end 
  

  def save
    self.class.all << self
  end



def self.find_by_name(name)
  #name is Hello
  # new_song = Song.new
  # new_song.name = name
  @@all.find {|song| song.name == name}
    #this statement returns true or false, not a value
end


def self.find_or_create_by_name(name) 
    self.find_by_name(name) ||  self.create_by_name(name) 
end 
    
    
def self.alphabetical
  self.all.sort_by{|s| s.name}
end

def self.new_from_filename(name)
  split_file = name.chomp(".mp3").split(" - ")
  new_song = Song.new
  new_song.name = split_file[1]
  new_song.artist_name = split_file[0]
  new_song
end 


def self.create_from_filename(name) 
 split_file = name.chomp(".mp3").split(" - ")
  #song_match = Song.new 
  song_match.name = split_file[1]
  song_match.artist_name = split_file[0]
  binding.pry 
end 

def self.destroy_all 
  @@all.clear
end 
end 