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
    return song 
  end
  
  def self.new_by_name(name)
     song = self.new
     song.name = name 
  return song
  end
  
  def self.create_by_name(name)
     song = self.new
     song.name = name 
     @@all << song 
     return song
  end
   
  def self.find_by_name(name)
    self.all.find do |x|
    x.name == name
    end
  end 
  
  def self.find_or_create_by_name(name)
        if song = self.find_by_name(name)
          return song 
        else self.create_by_name(name)
        end
  end
    
    def self.alphabetical 
      self.all.sort_by do |x|
        x.name
      end
    end
    
    def self.new_from_filename(filename)
      no_format = filename.split(" - ")
      name_nomp3 = no_format[1].split(".")
      
      name = name_nomp3[0]
      artist_name = no_format[0]
   
      song = Song.new
      song.name = name
      song.artist_name = artist_name
      song
    end
   
   def self.create_from_filename(filename)
      no_format = filename.split(" - ")
      name_nomp3 = no_format[1].split(".")
      
      name = name_nomp3[0]
      artist_name = no_format[0]
   
      song = Song.new
      song.name = name
      song.artist_name = artist_name
      @@all << song
      song 
   end 
   
   def self.destroy_all
     self.all.clear
   end
   
end

