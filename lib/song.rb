# require 'pry'
# binding.pry

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

  def Song.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def Song.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def Song.find_by_name(song_name)
    self.all.find{ |song| song.name == song_name }
  end

  def Song.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def Song.alphabetical
    self.all.sort_by{ |s| s.name}
  end

  def self.new_from_filename(filename)
    split_array = filename.split(" - ")
    name = split_array[1].chomp(".mp3")
    artist_name = split_array[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def Song.create_from_filename(filename)
      split_array = filename.split(" - ")
      name = split_array[1].chomp(".mp3")
      artist_name = split_array[0]
      song = self.new
      song.name = name
      song.artist_name = artist_name
      song.save
      song
  end

  def self.destroy_all
    self.all.clear
  end

end
