class Song
  
  require 'pry'
  
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
song.save
song
end

def self.new_by_name(song_name)
 song = self.new
   song.name= song_name
   song
end

def self.create_by_name(song_name)
  song = self.create
  song.name= song_name
  song
end

def self.find_by_name(name)
self.all.find{|song| song.name == name}
end

def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name) || self.create_by_name(song_name)
end


def self.alphabetical
  all.sort_by{|song| song.name}
end

def self.new_from_filename(song)
  array = song.delete(".mp3")
  array_split = array.split('-')
  artist_name = array_split[0]
  binding.pry
  name = array_split[1]
end

def self.destroy_all
  self.all.clear
end

def self.create_from_filename
  
end

end


