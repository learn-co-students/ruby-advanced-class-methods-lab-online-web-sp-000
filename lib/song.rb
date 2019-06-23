require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist_name = artist
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    Song.new(name)
    @@all[-1]
  end

  def self.new_by_name(name)
    Song.new(name)
    @@all[-1]
  end

  def self.create_by_name(name)
    Song.new(name)
  end

  def self.find_by_name(name)
    if @@all.length > 0
      @@all.each do |instance|
        if instance.name == name
          return instance
        else
          nil
        end
      end
    else
      nil
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |instance|
      instance.name
    end
  end

  def self.new_from_filename(file_name)
    artist_song = file_name.split(" - ")
    artist = artist_song[0]
    song_and_file = artist_song[1]
    split_from_file = song_and_file.split(".")
    song = split_from_file[0]

    Song.new(song, artist)
    @@all[-1]
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def self.destroy_all
    @@all = []
  end

end
