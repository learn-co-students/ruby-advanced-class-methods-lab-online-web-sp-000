class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    s = Song.new
    s.save
    s
  end

  def self.new_by_name(name)
    # returns a song instance with that name set as its name property.
    s = Song.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = Song.new_by_name(name)
    s.save
    s
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.all.include?(self.find_by_name(name)) ? self.find_by_name(name) : self.create_by_name(name)
    # if self.all.include?(self.find_by_name(name))
    #   song = self.find_by_name(name)
    # else
    #   song = self.create_by_name(name)
    # end
    # song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_and_name = filename.split(" - ")
    artist = artist_and_name[0]
    name = artist_and_name[1].split(".mp3")[0]
    song = self.create_by_name(name)
    song.artist_name = artist
    song

  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
