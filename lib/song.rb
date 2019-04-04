require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create 
    @song = self.new   
    @song.save 
    @song 
  end 
  
  def self.new_by_name(name)
    @song = self.new 
    @song.name = name 
    @song 
  end 
  
  def self.create_by_name(name)
    song = self.create 
    @song.name = name 
    @song 
  end 
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end 
    
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      self.all.find {|song| song.name == name}
    else   
    Song.create_by_name(name)
    end 
  end 
    
  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end 
  
  def self.all
    @@all
  end

  def self.new_from_filename(song, artist_name)
    song = song.new 
    artist_name = artist_name.new 
    song.name = "Blank Space"
    @artist_name = artist_name
  end  
  
  def self.create_from_filename(song, artist_name)
   if filename.include?(".mp3")
    file = filename.split(".mp3")
   else 
     filename
   end 
  end  

  def save
    self.class.all << self
  end

  def self.destroy_all 
    @@all.clear 
  end 

end
