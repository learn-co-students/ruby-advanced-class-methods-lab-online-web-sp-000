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

  def self.create #custom constructor
    song = Song.new #creates a new song ID
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new #generates a song ID
    song.name = name  #assigns name argument to the @name of the song ID
    song
  end


end
