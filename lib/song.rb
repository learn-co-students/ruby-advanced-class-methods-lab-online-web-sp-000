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
    name = self.new
    @@all << name
    name
  end
  
  def self.new_by_name(name_of_song)
    song = self.new
    song.name=(name_of_song)
    song
  end
  
  def self.create_by_name(name_of_song)
    song = self.create
    song.name=(name_of_song)
    song
  end
  
  def self.find_by_name(name_of_song)
    name_array = []
    @@all.each do |song| 
      name_array << song.name 
      if name_array.any?(name_of_song)
        return song
      end
    end
    nil
  end
  
  def self.find_or_create_by_name(name_of_song)
    if self.find_by_name(name_of_song)
      self.find_by_name(name_of_song)   
    else 
      self.create_by_name(name_of_song)
    end
  end
  
  def self.alphabetical 
    @@all.sort do |song1, song2|
      song1.name <=> song2.name
    end
  end
  
  def self.new_from_filename(song)
    artist = song.split("-")[0].strip
    song_title = song.split("-")[1].strip.gsub(".mp3", '')
    song = self.new_by_name(song_title)
    song.artist_name= artist
    song
  end
  
  def self.create_from_filename(song)
    artist = song.split("-")[0].strip
    song_title = song.split("-")[1].strip.gsub(".mp3", '')
    song = self.create_by_name(song_title)
    song.artist_name= artist
    song
  end
  
  def self.destroy_all 
    @@all = []
  end
  
end
