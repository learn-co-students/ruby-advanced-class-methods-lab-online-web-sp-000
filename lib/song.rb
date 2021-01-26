require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #custom constructor
    song = Song.new #creates a new song ID
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new #generates a song ID
    song.name = name  #assigns name argument to the @name of the song ID
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find{|x| x.name == name }  #searches all instances of the class to see if a name property matches the name
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|x| x.name} #looks at all instances of Song class and sorts by the name property
  end

  def self.new_from_filename(filename)
    new_file = filename.split(" - ")  #splits the filename into an array
    artist_name = new_file[0] #sets artist name to the first array position
    song_name = new_file[1].gsub(".mp3","") #removes .mp3 from end and sets song name to 2nd array position
    song = self.new  #creates a new song
    song.name = song_name #saves song name under the name property
    song.artist_name = artist_name #saves artist name under the artist name property
    song
  end

  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
