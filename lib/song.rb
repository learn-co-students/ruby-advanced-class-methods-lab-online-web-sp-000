class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  # Class constructor methods

  def self.new_from_filename(file_name)
    # split the string at " - "
    string = file_name.split(" - ")
    artist_name = string[0]
    # .gsub(pattern, replacement)
    # the following line of code replaces the .mp3 pattern with a blank space
    song_name = string[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song 
  end

  def self.create_from_filename(file_name)
    # split the string at " - "
    string = file_name.split(" - ")
    artist_name = string[0]
    # .gsub(pattern, replacement)
    # the following line of code replaces the .mp3 pattern with a blank space
    song_name = string[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  # End of Class constructors
  
  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

end
