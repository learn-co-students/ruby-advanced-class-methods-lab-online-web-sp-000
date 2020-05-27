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
    song.name = name
    self.all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    self.all << song
    song
  end
  
  def self.find_by_name(song_name)
    self.all.find do |s|
      s.name == song_name
    end
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end
  
  
  def self.alphabetical
    self.all.sort_by {|obj| obj.name}
  end
  
  def self.new_from_filename(filename)
    song = Song.new
    song_name = filename.split(" - ")
    artist_name = song_name[0]
    new_song_name = song_name[1].split(".")
    song.name = new_song_name[0]
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
    # song = Song.new
    # song_name = filename.split(" - ")
    # artist_name = song_name[0]
    # new_song_name = song_name[1].split(".")
    # song.name = new_song_name[0]
    # song.artist_name = artist_name
    # self.all << song
  end
  
 def self.destroy_all
   @@all = []
 end
end

