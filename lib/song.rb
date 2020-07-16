require 'pry'
class Song
  attr_accessor :name, :artist_name, :filename
  @@all = []

  def self.all
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

  def self.new_by_name(name)
    song = self.new
    song.name = name   
    song 
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name   
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
    #alternative
    # self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    # alternative solution using "&" symbol
    # @@all.sort_by(&:name)
    @@all.sort_by {|song| song.name}
  end

  def self.filename_parse(filename)
    song_artist_array = filename.chomp('.mp3').split(' - ')
  end

  def self.new_from_filename(filename)
    song_artist_array = self.filename_parse(filename)
    song = self.create_by_name(song_artist_array[1])
    song.artist_name = song_artist_array[0]
    song
  end

  def self.create_from_filename(filename)
    song_artist_array = self.filename_parse(filename)
    song = self.create_by_name(song_artist_array[1])
    song.artist_name = song_artist_array[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

# binding.pry
