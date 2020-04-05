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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    @song = Song.new
    @song.name = name
    @song
  end

  def self.create_by_name(name)
    @song = Song.new
    @song.name = name
    @song.save
    @song
  end

  def self.find_by_name(name)
    @song = all.find{ |song| song.name == name}
  end 

  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    array = filename.split(' - ')
    artist = array[0]
    title  = array[1].gsub(".mp3", "")
    song = Song.new
    song.artist_name = artist
    song.name = title
    song
  end

  def self.create_from_filename(filename)
    array = filename.split(' - ')
    artist = array[0]
    title  = array[1].gsub(".mp3", "")
    song = Song.create
    song.artist_name = artist
    song.name = title
    song
  end

  def self.destroy_all
    @@all = []
  end

end
