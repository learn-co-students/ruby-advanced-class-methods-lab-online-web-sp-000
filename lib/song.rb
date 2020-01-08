
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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !Song.find_by_name(name)
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|name| name.name}

  end

  def self.new_from_filename(filename)

    filename = filename.split(' - ')
    artist = filename[0]
    song_name = filename[1]
    song_name = song_name.split('.')
    song = self.new
    song.name = song_name[0]
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)

    filename = filename.split(' - ')
    artist = filename[0]
    song_name = filename[1]
    song_name = song_name.split('.')
    song = self.new
    song.name = song_name[0]
    song.artist_name = artist
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
