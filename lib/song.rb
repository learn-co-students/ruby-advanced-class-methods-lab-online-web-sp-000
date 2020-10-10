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
    create = self.new
    create.save
    create
  end
  
  def self.new_by_name(name)
    new_by_name = self.new 
    new_by_name.name = name
    new_by_name
  end
  
  def self.create_by_name(name)
    create_by_name = self.new 
    create_by_name.name = name 
    create_by_name.save
    create_by_name
  end
  
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name 
    end
  end
  
  def self.find_or_create_by_name(name)
    @@all.find do |song|
      song == song
    end
    self.find_by_name(name) ||
    self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end
  
  def self.new_from_filename(filename)
    title = filename.split(" - ")
    artist_name = title[0]
    fullname, filetype = title[1].split(".")
    
    song = self.new 
    song.artist_name = artist_name
    song.name = fullname 
    song
  end
  
  def self.create_from_filename(filename)
    title = filename.split(" - ")
    artist_name = title[0]
    fullname, filetype = title[1].split(".")
    
    song = self.create 
    song.artist_name = artist_name
    song.name = fullname 
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
