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
    self.all << song
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
    self.all << song 
    song 
  end
  
  def self.find_by_name(song_name)
    self.all.find{|song|song.name == song_name}

  end

  def self.find_or_create_by_name(song_name)
    answer = self.find_by_name(song_name)
    if answer 
      answer
  
    else
      self.create_by_name(song_name)
      
    end  
    
  end
    
  def self.alphabetical
    sorted_songs = self.all.sort_by{|song|song.name}
    sorted_songs
  end
  
  def self.new_from_filename(filename_mp3)
    file = filename_mp3.split" - "
    file[1] = file[1].chomp(".mp3")
    song = self.new
    song.name = file[1]
    song.artist_name = file[0]
    song
  
  end
  
  def self.create_from_filename(filename_mp3)
    file = self.new_from_filename(filename_mp3)
    song = self.create
    song.name = file.name
    song.artist_name = file.artist_name
    song
    
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  

end
