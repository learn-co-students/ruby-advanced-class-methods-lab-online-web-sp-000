require 'pry'

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

  def self.create_by_name(x)
    song = self.create
    song.name = x
    song
  end

  def self.find_by_name(name)
    self.all.find{|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|z| z.name}
  end

  def self.new_from_filename(mp3)

    array = mp3.split(" - ")
    artist_name = array[0]
    song_name = array[1].chomp(".mp3")

    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(mp3)

    array = mp3.split(" - ")
    artist_name = array[0]
    song_name = array[1].chomp(".mp3")

    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.destroy_all
    @@all = []
  end

end
