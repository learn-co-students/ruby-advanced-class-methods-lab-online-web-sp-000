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
    # song = Song.new_by_name("The Middle")
    song = self.new
    song.name = name
        #takes in string name of a song
    # song.save
        #takes in string name of a song
    song
    #returns song instance 
      #song name set as name property
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    #accept a string name as a song
      #return matching song OR 
      #create a new song and return

    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    #   self.create_by_name(name)
    # end

    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    # (&:name)
    @@all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    #initialize song
    #initialize artist_name
    #filename format = "artist_name - song"
    
    song = self.new
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
