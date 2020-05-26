#Given:
class Song
  attr_accessor :name, :artist_name #basic properties
  @@all = [] #class variable to store all instances for Song created through the instance method Song#save

  def self.all
    @@all  #build class methods that interact on the class data of @@all
  end

  def save
    self.class.all << self
  end

#instantiates and saves the song, and it returns the new song that was created
  def self.create #class constructor
    song = self.new
    self.all << song
    song
  end

#instantiates a song with a name property
  def self.new_by_name(title) #class constructor
    song = self.new
    song.name = title
    song
  end

#instantiates and saves a song with a name property
  def self.create_by_name(title) #class constructor
    song = self.create
    song.name = title
    song
  end

#can find a song present in @@all by name
#returns falsey when a song name is not present in @@all
  def self.find_by_name(title) #class finder
    result = self.all.detect {|song| song.name == title}
    result
  end

#invokes .find_by_name and .create_by_name instead of repeating code
#returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
#creates a new Song object with the provided title if one doesn't already exist
  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result
      result
    else
      self.create_by_name(title)
    end
  end

  #song 1 == song 2

#returns all the song instances in alphabetical order by song name
  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

#initializes a song and artist_name based on the filename format
  def self.new_from_filename(filename)
    song_array = filename.split(" - ") #seperate artist name from the rest of the data
    song_array[1] = song_array[1].chomp(".mp3") #remove the mp3 part of the string
    song = self.new 
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

#initializes and saves a song and artist_name based on the filename format
  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

#clears all the song instances from the @@all array
  def self.destroy_all
    self.all.clear
  end

end
