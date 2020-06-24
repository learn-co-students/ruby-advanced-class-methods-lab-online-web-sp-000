

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    @song = self.new
    @@all << @song
    @song
  end
  
  def self.new_by_name(name)
    @song = self.new
    @song.name = name
    @song
  end
  
  def self.create_by_name(name)
    @song = self.new 
    @song.name = name
    @@all << @song
    @song 
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(song_name)
    found_song = self.find_by_name(song_name)
    if self.all.include?(found_song) != true 
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end
  
  def self.alphabetical
    sorted = @@all.sort_by{|song| song.name}
    sorted
  end
  
  def self.new_from_filename(filename)
    song = filename.split(" - ")
    song[1].slice! ".mp3"
    @song = self.new
    @song.name = song[1]
    @song.artist_name = song[0]
    @song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @song = song
    @@all << @song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
