class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.new_from_filename(filename)
    song = self.new
    filename_elements = filename.split(" - ")
    song.name = filename_elements[1].split(".mp3").join
    song.artist_name = filename_elements[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
