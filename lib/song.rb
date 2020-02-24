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
return song
  end

def self.new_by_name(name)
song = Song.new
song.name = name
song
end

def self.create_by_name(name)
  song = Song.create
  song.name = name
  song
end

def self.find_by_name(name)
self.all.find {|s| s.name == name}
end

def self.find_or_create_by_name(name)
if self.find_by_name(name) == nil
  self.create_by_name(name)
else
  self.find_by_name(name)
end
end

def self.alphabetical
self.all.sort{|a, b| a.name <=> b.name}
end

def self.new_from_filename(file)
  reg = /(.mp3)/
data = file.gsub(reg, "").split(" - ")
song = Song.new_by_name(data[1])
song.artist_name = data[0]
song
end

def self.create_from_filename(file)
  reg = /(.mp3)/
data = file.gsub(reg, "").split(" - ")
song = Song.create_by_name(data[1])
song.artist_name = data[0]
song
end

def self.destroy_all
self.all.clear
end

end
