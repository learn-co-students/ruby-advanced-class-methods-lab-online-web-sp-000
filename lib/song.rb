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
  
  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      song = self.create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    song = self.create_by_name(arr[1].split(".")[0])
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end
end

#rspec ./spec/song_class_methods_spec.rb:88 # Song Class Methods .create_from_filename initializes and saves a song and artist_name based on the filename format
#rspec ./spec/song_class_methods_spec.rb:97 # Song Class Methods .destroy_all clears all the song instances from the @@all array
