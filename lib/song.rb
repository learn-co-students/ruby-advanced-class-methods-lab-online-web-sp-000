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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      if song.name == name
        song
      end
    end
  end

  def self.find_or_create_by_name(name)
    song = create_by_name(name)
    find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_data = filename.split(/(\s-\s)|(\.)/)
    #binding.pry
    song = create_by_name(song_data[2])
    song.artist_name = song_data[0]
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
