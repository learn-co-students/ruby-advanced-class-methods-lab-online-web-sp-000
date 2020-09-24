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
  song = Song.new
  song.save
  song
end

def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end 

def self.create_by_name(name)
  
  song = self.create
  song.name = name
  song
end

def self.find_by_name(name)
  self.all.find{|p| p.name == name}
end 

def self.find_or_create_by_name(name)
  
  if self.find_by_name(name)
    return self.find_by_name(name)
  else 
    song = self.create_by_name(name)
   song
  end
end

def self.alphabetical
  @@all.sort_by{|song| song.name}
end

def self.new_from_filename(filename)
  array = filename.split(" - ")  
  
  artist_name = array[0]
  name = array[1].split(".")[0]
  song = self.new_by_name(name)
  song.artist_name = artist_name
  song
end

def self.create_from_filename(filename)
array = filename.split(" - ") 
artist_name = array[0]
  name = array[1].split(".")[0]
  song = self.new_by_name(name)
  song.artist_name = artist_name
  song.save
end

def self.destroy_all
  @@all = []
end

end