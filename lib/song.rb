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
    song.name = name
    @@all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    name = song_name
    song.name = name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    name = song_name
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(song_name)
    new_array = []
    @@all.each do |y|
      new_array << y.name
    end
    if new_array.find {|x| x == song_name}
    index = new_array.find_index {|x| x == song_name}
    return @@all[index]
    end
  end
  
  def self.find_or_create_by_name(song_name)
   if self.find_by_name(song_name) == nil
     self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
   end
  end
  
  def self.alphabetical
  @@all.sort_by {|y| y.name}
  end
  
  def self.new_from_filename(filename)
    new_array = []
    new_array=filename.split(" - ")
    song_name=new_array[1].chop.chop.chop.chop
    artist=new_array[0]
    song = self.new
    name = song_name
    song.name = song_name
    artist_name = artist
    song.artist_name= artist
    song
  end
  
  def self.create_from_filename(filename)
    new_array = []
    new_array=filename.split(" - ")
    song_name=new_array[1].chop.chop.chop.chop
    artist=new_array[0]
    song = self.new
    name = song_name
    song.name = song_name
    artist_name = artist
    song.artist_name= artist
    @@all << song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
