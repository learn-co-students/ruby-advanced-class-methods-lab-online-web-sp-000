require 'pry'

class Song
  attr_accessor :name, :artist_name
  attr_reader :name
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
  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
  end
  def self.alphabetical
    @@all.sort_by {|name| name.name}
  end
  def self.new_from_filename(file)
    song = self.new
    data = file.split(" - ")
    song.name = data[1].split(".")[0]
    song.artist_name = data[0]
    song
  end
  def self.create_from_filename(file)
    song = self.new
    data = file.split(" - ")
    song.name = data[1].split(".")[0]
    song.artist_name = data[0]
    @@all << song
    song
  end
  def self.destroy_all
    self.all.clear
  end
end
