class Song
  attr_accessor :name, :artist_name

  @@all = []

#def initialize(name, artist_name)
#  @artist_name = artist_name
#  @name = name
  #@@all << self
#end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
##########
def self.create
song = self.new
self.all << song
song
#instantiates and saves the song, and it returns the new song that was created
end

def self.new_by_name(name)
song = self.new
song.name = name
song #{|song|song.new}
  #instantiates a song with a name property
end
def self.create_by_name(name)
  song = self.create
  song.name = name
  song
  #self.all.create{|song| song.name == name}
  #instantiates and saves a song with a name property
end
def self.find_by_name(name)
  self.all.find{|song| song.name == name}
  #can find a song present in @@all by name
    # returns falsey when a song name is not present in @@all
end
def self.find_or_create_by_name(name)
  result = self.find_by_name(name)
     if result
       result
     else
       self.create_by_name(name)
     end
 #invokes .find_by_name and .create_by_name instead of repeating code
  #returns the existing Song object (doesn't create a new one)
    # when provided the title of an existing Song D
  #creates a new Song object with the provided title if one doesn't already exist
end
def self.alphabetical
  sorted = self.all.sort_by{ |song| song.name}
  #returns all the song instances in alphabetical order by song name
end
def self.new_from_filename(filename)
  song_array = filename.split(" - ")
  song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  #initializes a song and artist_name based on the filename format
end
def self.create_from_filename(filename)

  result = self.new_from_filename(filename)
  song = self.create
 song.name = result.name
  song.artist_name = result.artist_name
 song#initializes and saves a song and artist_name based on the filename forma
end
def self.destroy_all
  self.all.clear
  #clears all the song instances from the @@all array
end


end
