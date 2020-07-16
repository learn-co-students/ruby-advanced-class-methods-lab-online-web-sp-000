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
    all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    for i in 0..all.length - 1
      if all[i].name == song_name
        return all[i]
      end
    end
    return nil
  end

  def self.find_or_create_by_name(song_name)
    if !find_by_name(song_name)
      create_by_name(song_name)
    end
    find_by_name(song_name)
  end

  def self.alphabetical
    all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song_data = filename.split(" - ")
    song_name = song_data[1].slice(0, song_data[1].length - 4)
    song = self.new_by_name(song_name)
    song.artist_name = song_data[0]
    song
  end

  def self.create_from_filename(filename)
    song_data = filename.split(" - ")
    song_name = song_data[1].slice(0, song_data[1].length - 4)
    song = self.create_by_name(song_name)
    song.artist_name = song_data[0]
    song
  end

  def self.destroy_all
    all.clear
  end
end
