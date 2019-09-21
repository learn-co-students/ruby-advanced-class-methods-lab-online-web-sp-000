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
    newSongInstance = self.new
    self.all << newSongInstance
    newSongInstance 
  end
  
  def self.new_by_name(name)
    newSongInstance = self.new
    newSongInstance.name = name
    newSongInstance
  end
    
  def self.create_by_name(name)
    newSongInstance = self.new
    newSongInstance.name = name
    self.all << newSongInstance
    newSongInstance
  end
  
  def self.find_by_name(name)
    self.all.find {|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
      
  def self.alphabetical #sorting the whole object by name
    self.all.sort_by {|object| object.name}
  end
      
  def self.alphabetical_song_only
    sampleArray = Array.new()
    self.all.each {|i| sampleArray.push(i.name)}
    sampleArray.sort {|a, b| a <=> b}
  end
      
  def self.new_from_filename(file)
    newSongObject = self.new
    newSongObject.artist_name = file.split(" - ")[0]
    newSongObject.name = file.split(" - ")[1].split(".")[0]
    newSongObject
  end
    
  def self.create_from_filename(file)
    newSongObject = self.new
    newSongObject.artist_name = file.split(" - ")[0]
    newSongObject.name = file.split(" - ")[1].split(".")[0]
    self.all << newSongObject
    newSongObject
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end


print Song.create

# Song.create_by_name("Shake it off!")
# Song.create_by_name("The Middle")
# Song.create_by_name("Champion")
# Song.create_by_name("We will rock you")
# Song.create_by_name("Shut up and dance")
