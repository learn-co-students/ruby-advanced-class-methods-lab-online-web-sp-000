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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|obj| obj.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{ |obj| obj.name}
  end
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    array[1].slice!(".mp3")
  
    artist_name = array[0]
    song_name = array[1]
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
    new_song
  end
  
  def self.destroy_all
    self.all.clear
  end

end

song = Song.create
puts Song.all
puts song
