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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    result = self.all.detect {|song| song.name == name}
    result
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
      result
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    return_array = self.all.sort_by {|song| song.name}
    return_array
  end

  def self.new_from_filename(new_song)
    song_info = new_song.split(" - ")
    song_name = song_info[1].chomp(".mp3")
    artist_info = song_info[0]

    return_song = self.new_by_name(song_name)
    return_song.artist_name = artist_info
    return_song
  end

  def self.create_from_filename(new_song)
    song_info = new_song.chomp(".mp3").split(" - ")
    song_name = song_info[1]
    artist_info = song_info[0]

    return_song = self.create_by_name(song_name)
    return_song.artist_name = artist_info
    return_song
  end

  def self.destroy_all
    self.all.clear
  end

end
