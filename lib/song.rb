class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # Build a class constructor Song.create that initializes a song and saves it to the @@all class variable
  # either literally or through the class method Song.all. This method should return the song instance
  # that was initialized and saved.
  def self.create
    song = self.new
    @@all << song
    song
  end

  # Build a class constructor that takes in the string name of a song and returns a song instance
  # with that name set as its name property
  # Song.new_by_name should return an instance of Song and not a simple string or anything else.
  def self.new_by_name(name)
    s = self.new
    s.name = name
    # s is the instance of song
    s
  end

  # Build a class constructor that takes in the string name of a song and returns a song instance
  # with that name set as its name property and the song being saved into the @@all class variable.
  def self.create_by_name(name)
    s = self.new
    s.name = name
    s.save
    s
  end

  # Build a class finder Song.find_by_name that accepts the string name of a song
  # and returns the matching instance of the song with that name.
  def self.find_by_name(name)
    @@all.find { |title| title.name == name}
  end

  # This method will accept a string name for a song and either return a matching song instance
  # with that name or create a new song with the name and return the song instance.
  def self.find_or_create_by_name(name)
    # if find_by_name is true, do that, otherwise create song
      self.find_by_name(name) || self.create_by_name(name)
  end

  # Build a class method Song.alphabetical that returns all the songs
  # in ascending (a-z) alphabetical order.
  def self.alphabetical
    @@all.sort_by {|title| title.name}
  end

  # Build a class constructor that accepts a filename in the format of " - .mp3",
  # for example, "Taylor Swift - Blank Space.mp3".
  # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"),
  # the constructor should return a new Song instance with the song name set to Blank Space
  # and the artist_name set to Taylor Swift.
  # The filename input sent to Song.new_from_filename in the format of Taylor Swift - Blank Space.mp3
  # must be parsed for the relevant components. Separate the artist name from the rest of the data based on the - delimiter.
  # Don't forget that when you parse the song name, you have to remove the '.mp3' part of the string.

  # "Taylor Swift - Blank Space.mp3"
  def self.new_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end

  # do the above and save the song into @@all
  def self.create_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

end
