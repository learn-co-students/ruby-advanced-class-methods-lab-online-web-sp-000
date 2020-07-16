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
    self.all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    return song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    return song
  end
  
  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(file_name)
    working = []
    working = file_name.chomp(".mp3").split(" - ")
    art_name = working[0]
    song_name = working[1]
    song = self.new
    song.name = song_name
    song.artist_name = art_name
    return song
  end
  
  def self.create_from_filename(file_name)
    working = []
    working = file_name.chomp(".mp3").split(" - ")
    art_name = working[0]
    song_name = working[1]
    song = self.new
    song.name = song_name
    song.artist_name = art_name
    self.all << song
  end
  
  def self.destroy_all
    @@all.clear
  end
end