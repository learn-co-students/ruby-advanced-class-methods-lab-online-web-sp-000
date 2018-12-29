class Song
  attr_accessor :name, :artist_name
  @@all = []
  
   def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create #.create instantiates and saves the song, and it returns the new song that was created
    new_song = self.new
    @@all << new_song
    new_song  
  end

  def self.new_by_name(song_name) #.new_by_name instantiates a song with a name property
    new_song = self.new
    new_song.name = song_name
    new_song
  end
 
  def self.create_by_name(song_name) #.create_by_name instantiates and saves a song with a name property
     new_song = self.new
     new_song.name = song_name
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(song_name) #can find a song present in @@all by name
    self.all.detect { |song| song.name == song_name} # returns falsey when a song name is not present in @@all
  end
    
  def self.find_or_create_by_name(song_name) #invokes .find_by_name and .create_by_name instead of repeating code
    self.find_by_name(song_name) || self.create_by_name(song_name) # returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
    # creates a new Song object with the provided title if one doesn't already exist
  end
  
 def self.alphabetical
    @@all.sort_by! { |song| song.name } #returns all the song instances in alphabetical order by song name
  end
 
 def self.new_from_filename(file_name) # initializes a song and artist_name based on the filename format
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    new_song #return new_song
  end
 
  def self.create_from_filename(file_name) # initializes and saves a song and artist_name based on the filename format
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    @@all << new_song
  end

  def self.destroy_all # clears all the song instances from the @@all array
    @@all = []
  end
 end

 
