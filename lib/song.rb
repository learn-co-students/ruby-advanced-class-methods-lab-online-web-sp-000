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
    song.save
    return song
  end
  
  def self.find_by_name(name)
    @@all.find {|obj| obj.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if(find_by_name(name) != nil)
    self.find_by_name(name)
  else
    self.create_by_name(name)
  end
  end
  
  def self.alphabetical
    @@all.sort_by {|a,b| a.name}
  end
  
  def self.new_from_filename(name)
    array = name.split("-")
    artist_name = array[0].strip
    song_split = array[1].split(".")
    name = song_split[0].strip
    song = self.new_by_name(name)
    song.artist_name = artist_name
    return song
  end
  
  def self.create_from_filename(name)
    
    song = self.new_from_filename(name)
    song.save
    
  end
  
  def self.destroy_all
    @@all.clear
  end
end
