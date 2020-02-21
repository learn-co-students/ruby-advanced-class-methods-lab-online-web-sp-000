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
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    self.all << song
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical()
    self.all.sort_by{|x| x.name}
  end
  
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split("-")[1].chomp(".mp3")).lstrip
    song.artist_name = (name.split("-")[0]).rstrip
    song.save
    song
  end
  
  def self.create_from_filename(name)
    song = self.new
    song.name = (name.split("-")[1].chomp(".mp3")).lstrip
    song.artist_name = (name.split("-")[0]).rstrip
    self.all << song
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  song = Song.new_by_name("The Middle")
  
  
  
end