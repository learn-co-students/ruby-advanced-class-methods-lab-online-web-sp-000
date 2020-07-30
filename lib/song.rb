require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new # self is the Song class
    song.save # calls the #save method to add new instance to the @@all class variable
    song
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(name) # new instance without saving
    song = Song.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name) # new instance saved to @@all
    song = self.create
    song.name = name
    song
  end 
  
  def self.find_by_name(name) # given a song, this method searches for it by name
    @@all.detect do |song|
      song.name == name 
    end
  end
  
  def self.find_or_create_by_name(name) # searches for the given song and creates it if it is not found
    match = self.find_by_name(name)
    if match
      match
    else 
      self.create_by_name(name)
    end
  end 
  
  def self.alphabetical # sorts the array of songs alphabetically; sort_by automatically sorts ascending
    sorted = @@all.sort_by { |n| n.name }
      # .name is required to access the @name variable within the instance
    sorted
  end
  
  def self.new_from_filename(data)
    new_data = data.split(" - ")
      # divide the given string
    new_data[1] = new_data[1].chomp(".mp3")
      # remove the .mp3 from the end of the second element in the returned array
    song = self.new
    song.name = new_data[1]
      # assign the title (element 2) to the @name variable
    song.artist_name = new_data[0]
      # assign the artist (element 1) to the @artist_name variable
    song
  end
  
  def self.create_from_filename(data)
    new_data = data.split(" - ")
    new_data[1] = new_data[1].chomp(".mp3")
    song = self.create
    song.name = new_data[1]
    song.artist_name = new_data[0]
    song
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
end
