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
  new_song = self.new
  string = song.chomp(".mp3")
  array = string.split(' - ') 
  new_song.artist_name = array[0]
  new_song.name = array[1]
  new_song.save
  new_song
end

def self.destroy_all
  self.all.clear
end

def self.create_from_filename(filename)
  self.new_from_filename(filename)
end

end


