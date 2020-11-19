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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(sname)
    song = self.new
    song.name = sname
    song
 
  end

  def self.create_by_name(sname)
    song = self.create
    song.name = sname
    song
  
  end



  def self.find_by_name(sname)
    self.all.detect{|person| person.name == sname}
  end

  def self.find_or_create_by_name(sname)
    self.find_by_name(sname) || self.create_by_name(sname)
  end

  def self.alphabetical
    self.all.sort_by{|a| a.name }
  end
  
  
  
  def self.new_from_filename(filename)
    seperate = filename.split(" - ")
    artist_name = seperate[0]
    song_name = seperate[1].gsub(".mp3", "")
   
    
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    seperate = filename.split(" - ")
    artist_name = seperate[0]
    song_name = seperate[1].gsub(".mp3", "")
   
    
    song = Song.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all = []
  end


end