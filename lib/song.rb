
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
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|item| item.name}
  end

  def self.new_from_filename(mp3)
    song_array = mp3.split(/[-.]/).map{|item| item.strip}
    new_song = self.new
    new_song.name = song_array[1]
    new_song.artist_name = song_array[0]
    new_song
  end

  def self.create_from_filename(song_name)
    @@all << new_from_filename(song_name)
  end

  def self.destroy_all
    @@all.clear
  end
end
