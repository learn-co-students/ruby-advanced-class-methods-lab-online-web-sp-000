class Song
 
  attr_accessor :name, :artist_name
 
 @@all = []

  def self.all
    @@all
  end
  
  def initialize(name, artist)
    @name = (name)
    @artist_name = artist
    self.save
  end

  def save
    self.class.all << self
  end

  def self.create(name = nil, artist = nil)
    self.new(name, artist)
  end

  def self.new_by_name(name)
     self.create(name, nil)
 end
 
 def self.create_by_name(name)
   self.new_by_name(name)
 end

 def self.find_by_name(name)
    @@all.find {|song| song.name == name}
 end
  
 def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
 end
  
  def self.alphabetical
    @@all.sort_by { |songs| songs.name }
  end
  
  def self.new_from_filename(filename)
     song_info = filename.split(" - ")
     artist_name = song_info[0]
     song_name = song_info[1].chomp(".mp3")
      
      music = Song.new(song_name,  artist_name)
      music
    end
    
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  
  def self.destroy_all
    @@all = []
  end
  

end
