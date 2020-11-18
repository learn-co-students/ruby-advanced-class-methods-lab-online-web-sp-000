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
    self.all << song
    song
  end

  def self.new_by_name (name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name (name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
    result = self.find_by_name(name)
    if result
      result
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by {|word| word.name}
    sorted
  end

  def self.new_from_filename (title)
    rows = title.split(" - ")
    rows[1] = rows[1].chomp(".mp3")
    song = self.new
    song.name = rows[1]
    song.artist_name = rows[0]
    song
  end

  def self.create_from_filename (title)
    result = self.new_from_filename(title)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
