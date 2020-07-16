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

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song = self.new_by_name(song)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find { |s| s.name == name }
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) != nil
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    new_filename = filename.chomp(".mp3").split(" - ")
    song_name = new_filename[1]
    artist_name = new_filename[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_filename = filename.chomp(".mp3").split(" - ")
    song_name = new_filename[1]
    artist_name = new_filename[0]

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
