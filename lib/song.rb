require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize(name)
    @name = name
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new(song)
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new(name)
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name) 
    @@all.each do |song|
      if song.name == name 
        return song 
      end
    end
    nil
  end 
  
  def self.find_or_create_by_name(name) 
    if find_by_name(name)
      song = find_by_name(name) 
    else
      song = create_by_name(name)
    end
    song
  end 
  
  def self.alphabetical 
    @@all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    array = filename.split(".mp3")
    string = array.join
    artist_and_song = string.split(" - ")
    artist_name = artist_and_song[0]
    name = artist_and_song[1]
    song = new_by_name(name)
    song.artist_name = artist_name
    song
  end 
  
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
end
