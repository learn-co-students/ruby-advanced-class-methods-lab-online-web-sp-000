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
    song = self.new
    @@all << song
    song
  end 

  # takes in the string name of a song and returns a song instance with that name set as its name property
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  # takes in the string name of a song and returns a song instance with that name set as its name property and the song being saved into the @@all class variable.
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  # that accepts the string name of a song and returns the matching instance of the song with that name.
  def self.find_by_name(name)
    @@all.find{|i| i.name == name}
  end
  
  # accept a string name for a song and either return a matching song instance with that name or create a new song with the name and return the song instance
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  # returns songs in a-z order
  # https://ruby-doc.org/core-2.7.1/Enumerable.html#method-i-sort_by
  def self.alphabetical
    @@all.sort_by{|i| i.name}
  end
  
  # return a new Song instance with the song name set to Blank Space and the artist_name set to Taylor Swift
  def self.new_from_filename(name)
    song = self.new
    song.name = name.split(" - ")[1].delete_suffix(".mp3")
    #song = name[1]
    song.artist_name = name.split(" - ")[0]
    song
  end
  
  # Build a class constructor that accepts a filename in the format 
  # parse the filename correctly but should also save the Song instance that was created
  def self.create_from_filename(name)
    song = self.new
    song.name = name.split(" - ")[1].delete_suffix(".mp3")
    #song = name[1]
    song.artist_name = name.split(" - ")[0]
    @@all << song
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
