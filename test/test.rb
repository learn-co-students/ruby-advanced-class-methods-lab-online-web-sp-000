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
    newSongOnject = self.new
    self.all << newSongOnject
    newSongOnject
  end
  
  def self.new_by_name(name)
    newSongOnject = self.new
    newSongOnject.name = name
    newSongOnject
  end
    
  def self.create_by_name(name)
    newSongOnject = self.new
    newSongOnject.name = name
    self.all << newSongOnject
    newSongOnject
  end
  
  def self.find_by_name(name)
    self.all.find do |i|
      return i if i.name == name
    end
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
      
  def self.alphabetical_song_only #sorting just the names
    sampleArray = Array.new()
    self.all.each {|i| sampleArray.push(i.name)}
    sampleArray.sort {|a, b| a <=> b}
  end
      
  def new_from_filename(file)
  end
    
end

string =  "Taylor Swift - Blank Space.mp3"

print string.split(" - ")[0]

print string.split(" - ")[1].split(".")[0]

# name = array[0]
# songMp3 = array[1].split(".")
# song = songMp3[0]

# print name, song

