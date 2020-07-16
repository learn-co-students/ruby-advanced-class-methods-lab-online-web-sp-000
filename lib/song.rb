require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    @@all<<self.new
    @@all[-1]
  end

  def self.new_by_name(the_name)
    song=Song.new
    song.name=the_name
    song
  end

  def self.create_by_name(name)
    song=Song.new
    song.name=name
    @@all<<song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name==name}
  end

  # binding.pry

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort{|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    song_data_array=filename.split(" - ")
    the_artist=song_data_array[0]
    song_name=song_data_array[1].chomp(".mp3")
    song=Song.new
    song.name=song_name
    song.artist_name=the_artist
    song
  end

  def self.create_from_filename(name)
    song=self.new_from_filename(name)
    @@all<<song
  end

  def self.destroy_all
    self.all.clear
  end

  def new_song_with_artist
    Song.new
  end


  def save
    self.class.all << self
  end

end
