class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all              #self is Song class here
    @@all
  end

  def save
    self.class.all << self  #self is instance here
  end
  
  def self.create           #self is Song class here
    song = self.new
    song.save
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
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    field = filename.split(/[-.]/)
    name = field[1].strip
    artist_name = field[0].strip
    song = self.find_or_create_by_name(name)
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    field = filename.split(/[-.]/)
    name = field[1].strip
    artist_name = field[0].strip
    song = self.find_or_create_by_name(name)
    song.artist_name = artist_name
    song.save
    song   
  end
  
  def self.destroy_all
    @@all = []
  end
  
end
