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
    song= self.new
    song.save
    song
  end

  def self.new_by_name(string_name)
    song = self.new
    song.name = string_name
    # song.save
    song
  end

  def self.create_by_name(string_name)
    song = self.new
    song.name = string_name
    song.save
    song
  end

  def self.find_by_name(string_name)
    self.all.detect {|s| s.name == string_name}
  end

  def self.find_or_create_by_name(string_name)
    no_dups = self.find_by_name(string_name)
    if no_dups
      no_dups
    else
      self.create_by_name(string_name)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
