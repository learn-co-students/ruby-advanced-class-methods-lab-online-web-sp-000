class Song
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def initialize(name,artist_name = nil)
    if name != nil
      @name = name
    end
    
    if artist_name != nil
      @artist_name = artist_name 
    end
    
    @@all << self
  end

  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end
  
  def self.create
    Song.new(nil)
  end 
  
  def self.new_by_name(name)
    Song.new(name)
  end 
  
  def self.create_by_name(name, artist_name = nil)
    Song.new(name, artist_name)
  end 
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if !find_by_name(name)
      create_by_name(name)
    else 
      find_by_name(name)
    end 
  end
  
  def self.alphabetical
    @@all.sort_by {|object| object.name}
  end
  
  def self.new_from_filename(file_name)
    #"Taylor Swift - Blank Space.mp3"
    
    info_array = file_name.split("-")
    info_array[0] = info_array[0].strip
    info_array[1] = info_array[1].strip.delete_suffix('.mp3')  
    
    create_by_name(info_array[1], info_array[0])
  end
  
  def self.create_from_filename(file_name)
    #"Taylor Swift - Blank Space.mp3"
    
    info_array = file_name.split("-")
    info_array[0] = info_array[0].strip
    info_array[1] = info_array[1].strip.delete_suffix('.mp3')  
    
    create_by_name(info_array[1], info_array[0])
  end 
  
  def self.destroy_all
    @@all = []
  end 

end
