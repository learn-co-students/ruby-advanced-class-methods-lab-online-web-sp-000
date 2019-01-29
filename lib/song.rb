class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create # instantiates and saves the song, and returns the new song created
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(title) #instantiates a song with a name property
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title) #instantiates and saves a song with a name property
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(name) #can find a song present in @@all by name
    @@all.find{|person| person.name == name}
  end  #returns falsey when a song name is not present in @@all

  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result #invokes .find_by_name and .create_by_name instead of repeating code
      result
    else
      self.create_by_name(title)
  #returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
  #creates a new Song object with the provided title if one doesn't already exist
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

  #initializes a song and artist_name based on the filename format
  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
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

  def self.destroy_all #clears all the song instances from the @@all array
    self.all.clear
  end

end
