require 'pry'

class Song
  attr_accessor :name, :artist_name
    # def name=(name)
    #   @name = name
    # end
    #
    # def name
    #   @name
    # end


  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end


end
