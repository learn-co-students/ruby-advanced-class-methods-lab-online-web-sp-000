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
  def self.new_by_name(song)
    
    newSong = Song.new
    #newSong.save
    newSong.name = song
    newSong
  end
  def self.create_by_name(song)
    newSong = Song.new
    newSong.name = song
    newSong.save
    newSong
  end
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  def self.new_from_filename(mp3)
    songName = mp3.split(" - ")[1].split(".mp3").join(" ")
    artistName = mp3.split(" - ")[0]
    song = self.create_by_name(songName)
    song.artist_name = artistName
    song
  end
  def self.create_from_filename(mp3)
    songName = mp3.split(" - ")[1].split(".mp3").join(" ")
    artistName = mp3.split(" - ")[0]
    song = self.create_by_name(songName)
    song.artist_name = artistName
    song.save
    song
  end
  def self.destroy_all
    @@all.clear
  end
end
