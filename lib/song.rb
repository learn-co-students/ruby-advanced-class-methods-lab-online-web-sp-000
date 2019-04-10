require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name, artist)
  #   self.name(name)
  #   self.artist_name(artist)
  # end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    #binding.pry
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    @@all << song
    song.name = name
    return song
  end

  def self.find_by_name(name)
    @@all.find {|x| x.name ==name}
  end

  def self.find_or_create_by_name(name = nil)
    find_by_name(name)||create_by_name(name)||(@@all.find(name))
  end

  def self.alphabetical
    @@all.sort {|x, y| x.name <=> y.name}
  end

  def self.new_from_filename(fname)
    chars = fname.split(/[-.]/)
    #binding.pry
    song = create_by_name(chars[1].strip)
    song.artist_name = chars[0].strip
    return song
  end

  def self.create_from_filename(fname)
    chars = fname.split(/[-.]/)
    #binding.pry
    song = create_by_name(chars[1].strip)
    song.artist_name = chars[0].strip
    @@all << song
    return song
  end

  def self.destroy_all
    @@all.clear
  end
end
