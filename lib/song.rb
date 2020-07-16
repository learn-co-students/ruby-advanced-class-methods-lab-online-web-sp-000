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
   @@all << song
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
    @@all << song
    song
  end
  
  
  def self.find_by_name(name)
    self.all.find {|n| n.name == name}
  end
  
  
  def self.find_or_create_by_name(name)
        
      if self.find_by_name(name) == nil
        self.create_by_name(name)
      else  
        return self.find_by_name(name)
      end
        
  end
  
  
  def self.alphabetical
    @@all.sort_by!{ |a| a.name.downcase }
  end
  
  
  def self.new_from_filename(file)
    
    song_string = file.split("-")
    
    artist_prep = song_string[0]
    name_prep = song_string[1].split(".")
    
    artist = artist_prep.strip
    name = name_prep[0].strip
    
    song = self.new 
    song.name = name
    song.artist_name = artist 
    song
    
  end
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    self.all << song 
  end
    
  def self.destroy_all
    @@all.clear
  end
    
    
  
  
  
    
    
end
