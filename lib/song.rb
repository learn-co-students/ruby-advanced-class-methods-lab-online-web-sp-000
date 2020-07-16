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
    self.all << song
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
    find = self.all.detect {|song| song.name == name}
    find
  end

  def self.find_or_create_by_name(name)
    find = self.find_by_name(name)
    if find
      find
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    ordered = self.all.sort_by {|song| song.name}
    ordered
  end

  def self.new_from_filename(file)
    song_array = file.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(file)
    result = self.new_from_filename(file)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
