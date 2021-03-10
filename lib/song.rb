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

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    x = self.find_by_name(name)
    if x == nil
      self.create_by_name(name)
    else
      x
    end
  end

  def self.alphabetical
    self.all.sort_by { |x| x.name }
  end

  def self.new_from_filename(file)
    x = file.split(" - ")
    artist_name = x[0]
    y = x[1].split(".")
    song_title = y[0]
    song = self.new_by_name(song_title)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    x = file.split(" - ")
    artist_name = x[0]
    y = x[1].split(".")
    song_title = y[0]
    song = self.new_by_name(song_title)
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end
