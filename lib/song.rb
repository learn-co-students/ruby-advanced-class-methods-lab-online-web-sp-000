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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect do |instances|
      song_name == instances.name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|instance| instance.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song_properties = filename.split(" - ")
    # binding.pry
    song.artist_name = song_properties[0]
    song.name = song_properties[1].chomp('.mp3')
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song_properties = filename.split(" - ")
    song.artist_name = song_properties[0]
    song.name = song_properties[1].chomp('.mp3')
    song.save
  end

  def self.destroy_all
    self.all.clear
  end


end
