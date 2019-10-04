
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
    create_self = self.new
    create_self.save
    create_self
  end
   
   def self.new_by_name(new_song)
     song = self.new
     song.name = new_song
     song
    end

  def self.create_by_name(new_song)
    song = self.create
    song.name = new_song
    song
  end
 
  def self.find_by_name(name)
    self.all.find {|n| n.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    new_array = filename.split(/\s\-|\./)
    name = new_array[1]
    artist_name = new_array[0]
    
    song = self.new
    song.name = name 
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    new_array = filename.split(-)
    name = new_array[1]
    artist_name = new_array[0]
    
    song = self.new
    song.name = name 
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
  
end
