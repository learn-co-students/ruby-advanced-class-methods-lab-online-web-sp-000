
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
  end

  def self.create
    s = Song.new
    @@all << s
    return s
  end

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    return new_song
  end

  def self.create_by_name(song)
    new_song = self.new
    new_song.name = song
    @@all<<new_song
    return new_song
  end

  def self.find_by_name(song)
    @@all.find {|s| s.name == song }
  end

  def self.find_or_create_by_name(song)
    song_1 = self.find_by_name(song)

    if song_1
      return song_1
    else
      return self.create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by { |s| s.name }
  end

  def self.new_from_filename(filename)
    names = filename.split(' - ')
    song_name= names[1].gsub(".mp3","")
    artist_name= names[0]
    song= Song.new_by_name(song_name)
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(filename)
    song= self.new_from_filename(filename)
    song.save
    return song
  end

  def self.destroy_all
    @@all = [] 
  end



  def self.all
    @@all
  end

  def save
    self.class.all << self

  end
end
