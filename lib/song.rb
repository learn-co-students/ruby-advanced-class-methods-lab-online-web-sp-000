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

  def self.new_from_filename(filename)
    first_split = filename.split(".mp3")
    new_file = first_split[0].split(" - ")
    @song = Song.new 
    @song.name = new_file[1] 
    @song.artist_name = new_file[0]  
    @song 
  end  
  
  def self.create_from_filename(filename)
   first_split = filename.split(".mp3")
   new_file = first_split[0].split(" - ")
    @song.name = new_file[1] 
    @song.artist_name = new_file[0]  
    @song.save  
  end  

  def save
    self.class.all << self
  end

  def self.destroy_all 
    @@all.clear 
  end 

end
