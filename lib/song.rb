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
  
  def self.new_by_name(song_name)
    song = self.new
    song.name= song_name
    song 
  end 
  
  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song 
  end 
  
  def self.find_by_name(song_name)
    all.find {|song| song.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil 
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end 
  end 
  
  def self.alphabetical
    all.sort {|a,b| a.name <=> b.name}
  end 

  def self.new_from_filename(filename)
    artist_and_song = filename.chomp(".mp3").split(" - ")
    song_name = artist_and_song[1]
    song = self.new_by_name(song_name)
    song.artist_name= artist_and_song[0]
    song 
  end 

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end 
  
  def self.destroy_all
    self.all.clear
  end 

end
