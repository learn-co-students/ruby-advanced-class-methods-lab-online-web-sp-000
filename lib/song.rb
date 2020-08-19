class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create #class method
    newsong = self.new
    self.all << newsong #self insdieclassm ethod = class. self.new = class.new = Song.new
    newsong
  end

  def self.new_by_name(name)
    #self.create create an instance with no name
    #self.new by name crates an instance with name
    newsong = self.new
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    #same as self.newbyname but u also add to to the @@all array
    newsong = self.new_by_name(name)
    self.all << newsong
    newsong
  end

  def self.find_by_name(name)
    self.all.find  do |song|
       song.name == name
     end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) #truthy return
      self.find_by_name(name) #return the song result
    else
      self.create_by_name(name) #create and return new song
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename.slice! ".mp3"
    #returns the trashed piece and nil if nothing was cut. the original filename is forever modified
    artistandsong = filename.split(" - ") #ex: [ "taylor swift", "blank space"]
    #make new song instnace but no saving
    newsong = self.new_by_name(artistandsong[1])
    newsong.artist_name = artistandsong[0]
    newsong
  end

  def self. create_from_filename(filename)
    filename.slice! ".mp3"
    artistandsong = filename.split(" - ") #
    #make new song instnace WITH SAVING
    newsong = self.create_by_name(artistandsong[1])
    newsong.artist_name = artistandsong[0]
    newsong
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
