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

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
#    song = self.new
#    song.name = song_title
    song = self.new_by_name(song_title)
    song.save
    song
  end

  def self.find_by_name(song_title)
    @@all.find {|song| song.name == song_title}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create_by_name(title)
    end
    #  self.find_by_name(title) || self.create_by_name(title) - this is so much better
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    array = file.split(" - ")
    song_name = array[1].gsub(".mp3", "")

    song = self.new_by_name(song_name)
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(file)
    array = file.split(" - ")
    song_name = array[1].gsub(".mp3", "")

    song = self.create_by_name(song_name)
    song.artist_name = array[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
