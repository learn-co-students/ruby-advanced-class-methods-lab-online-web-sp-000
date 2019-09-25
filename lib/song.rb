class Song
  
 attr_accessor :name, :artist_name
 
  @@all = []

def initialize
  @@all 
  save
end

def self.all
  @@all
end

def save
  self.class.all << self
end

def self.create
song = Song.new
song.save
save
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
  if self.find_by_name(song_name)
else
  self.create_by_name(song_name)
end
end

def self.alphabetical
  new_array = self.all.sort_by{|word| word}
return new_array
end

def self.new_from_filename(song)
end

def self.destroy_all
  self.all.clear
end

def self.create_from_filename
  
end

end


