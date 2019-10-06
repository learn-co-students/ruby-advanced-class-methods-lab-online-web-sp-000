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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect { |object| object.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |object| object.name }
  end

  def self.new_from_filename(file)
    data = file.split(/[-.]/)
    artist = data[0].strip
    song = data[1].strip
    new_object = self.new_by_name(song)
    new_object.artist_name = artist
    new_object
  end

  def self.create_from_filename(file)
    new_object = self.new_from_filename(file)
    new_object.save
  end

  def self.destroy_all
    self.all.clear
  end

end
