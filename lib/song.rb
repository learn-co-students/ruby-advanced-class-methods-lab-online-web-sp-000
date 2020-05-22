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
    @@all << song
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
    self.all.find{|x| x.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|n| n.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    data_two = data[1].split(".")

    artist = data[0]
    title = data_two[0]

    song = self.new_by_name(title)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    data_two = data[1].split(".")

    artist = data[0]
    title = data_two[0]

    song = self.create_by_name(title)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

