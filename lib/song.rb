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
    @@all << song
    song
  end
  
  
  def self.new_by_name(name)
    song = Song.create
    song.name = name
    # binding.pry ## lesson learned:  binding.pry hi-jacks return when placed at end of code 
    song 
  end
  
  
  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end 
   
    
  def self.find_by_name(name)
    @@all.find do |song|
    song.name == name
    end  
  end
    
    
  def self.find_or_create_by_name(name)
 
    if !Song.find_by_name(name)
      Song.create_by_name(name)
    else  
      Song.find_by_name(name)
    end 
  end 
 
 
  def self.alphabetical
      
    @@all.sort_by do |song|
      song.name 
    end
  end 
      
      
  def self.new_from_filename(filename)
      
    # processing
      
    parse_filename_into_array = filename.split(" - ")
    combine_parsed_filename_into_string = parse_filename_into_array.join(".")
    parse_period_delim_into_array = combine_parsed_filename_into_string.split(".")
    parse_period_delim_into_array.pop 
    name = parse_period_delim_into_array[1]
    artist_name = parse_period_delim_into_array[0]

    # new instance
      
    song = Song.create
    song.name = name
    song.artist_name = artist_name
    song
   
  end
    
    
  def self.create_from_filename(filename)
    Song.new_from_filename(filename)
  end 
 
 
  def self.destroy_all
    self.all.clear
  end
    
end

