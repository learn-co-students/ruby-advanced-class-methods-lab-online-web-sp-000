require "pry"
class Song
  attr_accessor :name, :artist_name, :all
  @@all = []

  def self.all()
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
    #=>initializes a song and saves it to the @@all class variable
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
    #=> takes in the string name of a song and returns a song instance
    #=>with that name set as its name property and the song being saved into the @@all class variable.
  end


  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
    #=>takes in the string name of a song and returns a song instance with that name set
    #=>as its name property and the song being saved into the @@all class variable.
  end

  def self.find_by_name(song_name)
    self.all.detect { |i| i.name == song_name }
    #=>Finder that accepts the string name of a song and
    #=>returns the matching instance of the song with that name.
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #=> accept a string name for a song and either return a matching song instance
    #=>with that name or create a new song with the name and return the song instance.
  end

  def self.alphabetical
    self.all.sort_by { |x| x.name}
    #=> returns all the songs in ascending (a-z) alphabetical order.
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1].chomp(".mp3")
    artists_name = filename.split(" - ")[0]
    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artists_name
    new_song
    #=> a class constructor that accepts a filename in the format of " - .mp3",
    #=> for example, "Taylor Swift - Blank Space.mp3".
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
    #=>class constructor that accepts a filename in the format of " - .mp3",
    #=>for example "Taylor Swift - Blank Space.mp3"
  end

  def self.destroy_all
    self.all.clear
    #=>class method should reset the state of the @@all
  end
end
