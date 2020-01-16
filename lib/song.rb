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
    # @@all << self.new
    # @@all
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.create_by_name(song_name)
    self.find_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    artist_title = filename.split(" - ")
    artist = artist_title[0]
    title = artist_title[1].chomp(".mp3")
    new_song = Song.new
    new_song.artist_name = artist
    new_song.name = title
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end



end
