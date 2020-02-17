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
    song = self.new #initializes a song/variable passed in
    song.save #uses the save method via the .all class method to shovel into the array
    song #returns the song instance above
end

def self.new_by_name(name)
  song = self.new #initializes a song
  song.name = name #sets the property of the instance via the argument passed
  song # returns
end 

def self.create_by_name(name)
  song = self.create 
  song.name = name
  song
end 

def self.find_by_name(name)
  self.all.find do |song| song.name == name
end
end
  
  

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
end


def self.alphabetical
  self.all.sort_by {|song| song.name}
end

def self.new_from_filename(filename)
  file_array = filename.sub!(/.mp3/, '').split(" - ")
  song = self.new
  song.name = file_array[1]
  song.artist_name = file_array[0]
  song
end

def self.create_from_filename(filename)
  file_array = filename.sub!(/.mp3/, '').split(" - ")
  song = self.create
  song.name = file_array[1]
  song.artist_name = file_array[0]
  song
end

def self.destroy_all
  self.all.clear
end

#YYYYYEEEEEEEEEEEEEEEEEEEEESSSSSSSSSSSSSSSSSSSSS!!!!! 
# quick note, this lab was a nightmare.

end
  