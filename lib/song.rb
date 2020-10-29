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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(song)
    new_song = self.new
    song.split(" - ").each_with_index do |value,index|
      #["Taylor Swift", "Blank Space.mp3"]
      new_song.artist_name = value if index == 0
      new_song.name = value.split(".")[0] if index == 1
    end
    new_song
  end

  def self.create_from_filename(song)
    new_song = self.new
    new_song.class.new_from_filename(song).save

  end

  def self.destroy_all
    self.all.clear
  end

end
