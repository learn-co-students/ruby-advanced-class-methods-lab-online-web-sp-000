require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all # class reader
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
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
      self.all.find{|songs| songs.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
      song = self.find_by_name(song_name)
      if song
        song
    else
      self.create_by_name(song_name)
    end
    end

    def self.alphabetical
    @@all.sort_by {|song_name| song_name.name}

    end

    def self.new_from_filename(filename)
        song = self.new
        song_array = filename.split("-")
        song.name = song_array[1].scan(/^[ \t]+(.*)\.[^.]+$/).join
        song.artist_name = song_array[0].strip
        song
    end

    def self.create_from_filename(filename)
      song = self.new
      song_array = filename.split("-")
      song.name = song_array[1].scan(/^[ \t]+(.*)\.[^.]+$/).join
      song.artist_name = song_array[0].strip
      @@all << song
      song
    end

    def self.destroy_all
      @@all.clear
    end


end
