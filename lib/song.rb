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

  def self.new_by_name(string)
    song = self.create
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = self.create
    song.name = string
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|title| title.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name)? self.find_by_name(song_name) : self.create_by_name(song_name)
  end

  def self.alphabetical
    result = self.all.uniq.sort_by{|song| song.name}
    result
  end

  def Song.new_from_filename(file_name)
    file_name = file_name.slice(0...-4)
    data = file_name.split(' - ')
    new_song = self.create_by_name(data[1])
    new_song.artist_name = data[0]
    new_song
  end

  def self.create_from_filename(file_name)
    new_creation = Song.new_from_filename(file_name)
    new_creation
  end

  def self.destroy_all
    self.all.clear
  end


end
