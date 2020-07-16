class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #instantiates and saves the song, returns the new song
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name) #instantiates with a song with a name
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) #if found, return the song
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by(&:name)
  end

  def self.new_from_filename(name) #split the name on the -, remove the mp3
    new_name = name.slice! ".mp3"
    split_name = name.split('-')
    artist_name = split_name[0].to_s.strip
    song_name = split_name[1].to_s.strip
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(name)
    new_name = name.slice! ".mp3"
    split_name = name.split('-')
    artist_name = split_name[0].to_s.strip
    song_name = split_name[1].to_s.strip
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
