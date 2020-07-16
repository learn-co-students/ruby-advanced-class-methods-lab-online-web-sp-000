   require "pry"
   class Song

  attr_accessor :name, :artist_name
  @@all = []
  
  def save
    self.class.all << self
  end 
  
  def self.create
    new_song = self.new
    new_song.save
    new_song
  end 

 def self.new_by_name(inputted_name)
new_song = self.new
new_song.name = "#{inputted_name}"
new_song
end 

def self.create_by_name(inputted_name)
  new_song = self.new_by_name(inputted_name)
  new_song.save
  new_song
end

def self.find_by_name(desired_song)
self.all.find {|song| song.name == desired_song}
end

def self.find_or_create_by_name(desired_song)
  if self.find_by_name(desired_song) != nil 
    self.find_by_name(desired_song)
  else 
    self.create_by_name(desired_song)
  end 
end

def self.alphabetical
self.all.sort_by{|song| song.name}
end 

def self.new_from_filename(filename)
  splitted = filename.split(" - ")
  inputted_artist = splitted[0]
  inputted_song = splitted[1].chomp(".mp3")
  
  added_song = self.new_by_name(inputted_song)
  added_song.artist_name = inputted_artist
  added_song
end

def self.create_from_filename(filename)
  self.all << self.new_from_filename(filename)
end 

def self.destroy_all
  self.all.clear
end 

  def self.all
    @@all
  end
  
end
