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
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    song_name = self.all.find {|song| song.name == title}
    song_name
  end

  def self.find_or_create_by_name(title)
    song_name = self.find_by_name(title)
    if song_name
      song_name
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    sorted_songs = self.all.sort_by {|song| song.name}
    sorted_songs
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
    song_info = filename.split(" - ")
    artist_name = song_info[0]
    song_name = song_info[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
