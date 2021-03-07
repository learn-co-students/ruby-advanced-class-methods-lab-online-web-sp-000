class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create   # instantiates a song with a name property
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)    # instantiates a song with a name property
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)   # instantiates and saves a song with a name property
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)                   # can find a song present in @@all by name (FAILED - 1)
    self.all.find {|song| song.name == name }   #  returns falsey when a song name is not present in @@all (FAILED - 2)
  end


  def self.find_or_create_by_name(name)
    #  invokes .find_by_name and .create_by_name instead of repeating code
    #  returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
    #  creates a new Song object with the provided title if one doesn't already exist
    if self.find_by_name(name) # == true
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end


  def self.alphabetical   # returns all the song instances in alphabetical order by song name
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)    #  initializes a song and artist_name based on the filename format
    song_array = filename.split(/\-|\./)      # splits string into array by - or .
    #song_array.pop                           # removes the .mp3 tag ... not neccessary
    song = self.new                           # instantiates new song
    song.name = song_array[1].strip           # name is 2nd item in song_array and trim/strip white spaces
    song.artist_name = song_array[0].strip    # artist_name is 1st item in song_array and trim/strip white spaces
    song                                      # return song instance
  end

  def self.create_from_filename(filename)   #  initializes and saves a song and artist_name based on the filename format
    self.new_from_filename(filename).save
  end

  def self.destroy_all    # clears all the song instances from the @@all array
    self.all.clear
  end

end
