class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  #instantiate a new song using class.new 
  #save the song 
  #return the song 
  def self.create
    song = Song.new  
    song.save 
    song 
  end 
  
  #instantiate a song with a name property 
  #pass in the name 
  #define song as the new instance 
  #set the name property of the song = to name 
  #save the name 
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song 
  end

#instantiate and save a song with a name property 
  def self.create_by_name(name)
    song = self.create 
    song.name = name 
    song
  end 
  
  #can find a song present in @@all by name 
  #return falsey when a song name is not present in @@all 
  #can find a song present in @@all by name
  #returns falsey when a song name is not present in all 
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end 
  
  #both methods with or in the middle 
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  
  #returns all the song instnaces in alphabetical order
  #sort ALL instances of self 
  #iterate over the song on the song name 
  #sorting alphabetical on the song name not song id 
  def self.alphabetical 
    self.all.sort_by {|song| song.name}
  end 
  
  #initializes a song and artist_name based on the filename format 
  #split the file with - 
  #Taylor Swift - Red (artist name - song )
  def self.new_from_filename (filename)
    file = filename.split(" - ")
    artist_name = file[0]
    name = file[1].gsub('.mp3',"")
    song = self.new 
    song.name = name 
    song.artist_name = artist_name
    song 
  end 
  
  #initializes and saves a song and artist_name based on the filename format 
  def self.create_from_filename(filename) 
    file = filename.split(" - ")
    artist_name = file[0]
    name = file[1].gsub('.mp3',"")
    song = self.create
    song.name = name 
    song.artist_name = artist_name
    song 
  end   
  
  #clear all the song instnances from the @@all array 
  def self.destroy_all 
    self.all.clear
  end   
  
end   
  
