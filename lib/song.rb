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
    # if song exists (check @@all) return song instance
      if self.find_by_name
    # else create new song
      else self.create_by_name
      end
  end
end
