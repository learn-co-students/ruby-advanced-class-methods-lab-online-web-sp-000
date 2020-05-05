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
    song = Song.new
    song.name = song_name
    song 
  end 

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song 
  end 

  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}    
  end 

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end 

  def self.new_from_filename(song_name)
    first_array = song_name.split(/,|-/) # ---> ["Thundercat ", " For Love I Come.mp3"]
    artist = first_array[0].strip
    song = first_array.last.split('.').first.strip
    filename = song_name.split('e').last
    
    new_song = Song.new
    new_song.artist_name = artist
    new_song.name = song 
    new_song
  end 

  def self.create_from_filename(song_name)
    first_array = song_name.split(/,|-/) # ---> ["Thundercat ", " For Love I Come.mp3"]
    artist = first_array[0].strip
    song = first_array.last.split('.').first.strip
    filename = song_name.split('e').last
    
    new_song = Song.create
    new_song.artist_name = artist
    new_song.name = song 
    new_song
  end 

  def self.destroy_all
    @@all.clear
  end 

end
