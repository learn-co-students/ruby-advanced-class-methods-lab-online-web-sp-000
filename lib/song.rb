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
    self.new.save.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name).save.last
  end

  def self.find_by_name(name)
    self.all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    !self.find_by_name(name) ? self.create_by_name(name) : self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    artist = file_name.split(" - ")[0]
    song_name = file_name.split(" - ")[1].split(".")[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save.last
  end

  def self.destroy_all
    self.all.clear
  end
end
