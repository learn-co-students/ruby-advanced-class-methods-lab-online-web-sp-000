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

  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = self.create
    song.name = string
    song
  end

  def self.find_by_name(string)
    self.all.find{ |song| song.name == string}
  end

  def self.find_or_create_by_name(string)
    if self.find_by_name(string)
      self.find_by_name(string)
    else
      self.create_by_name(string)
    end
  end

  def self.alphabetical
    self.all.sort_by{ |word| word.name}
  end

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    artist = file_array[0]
    song = file_array[1].chomp(".mp3")
    
    new_song = self.create_by_name(song)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file)
    file_array = file.split(" - ")
    artist = file_array[0]
    song = file_array[1].chomp(".mp3")

    new_song = self.create_by_name(song)
    new_song.artist_name = artist
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
