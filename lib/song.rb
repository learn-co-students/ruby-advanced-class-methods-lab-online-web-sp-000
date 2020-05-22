require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
  end

  def self.create
    song = self.new.save
  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    song = self.new_by_name(name).save
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(filename)
    song = filename.split(" - ")
    name = ((song[1].split(".")[0]))
    artist_name = song[0]
    self.new(name, artist_name)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
    self
  end

end
