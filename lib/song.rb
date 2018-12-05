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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
    # if the first condition renders something true, then the second part is not even evaluated because the whole
    # expression will be true. If it does not render as true, then it will go to the second one.
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by(&:name)
    # self.all.sort_by{|song| song.name} is another option
  end

  def self.new_from_filename(filename)
    song = self.new
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
