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
    newSong = self.new
    @@all << newSong
    newSong
  end

  def self.new_by_name(name)
    newSong = self.new
    newSong.name = name
    newSong
  end

  def self.create_by_name(name)
    newSong = self.new_by_name(name)
    @@all << newSong
    newSong
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(' - ')
    artist = split_filename[0]
    remove_extension = split_filename[1].split('.')
    name = remove_extension[0]
    newSong = self.new_by_name(name)
    newSong.artist_name = artist
    newSong
  end

  def self.create_from_filename(filename)
    split_filename = filename.split(' - ')
    artist = split_filename[0]
    remove_extension = split_filename[1].split('.')
    name = remove_extension[0]
    newSong = self.find_or_create_by_name(name)
    newSong.artist_name = artist
  end

  def self.destroy_all
    @@all.clear
  end
end
