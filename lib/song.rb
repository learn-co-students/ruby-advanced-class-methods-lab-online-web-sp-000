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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    @name = name
    song = self.create
    song.name = @name
    song
  end

  def self.find_by_name(name)
    @name = name
    self.all.find { |object| object.name == @name }

  end

  def self.find_or_create_by_name(name)
    @name = name
    self.find_by_name(@name) || self.create_by_name(@name)
  end

  def self.alphabetical
    self.all.sort_by { |object| object.name }
  end

  def self.from_file(file_name)
    @file_name = file_name.split(" - ")
    @artist_name = @file_name[0]
    @song_name = @file_name[1]
    @song_name.delete_suffix!(".mp3")
    [@song_name, @artist_name]
  end

  def self.new_from_filename(file_name)
    @file_name = file_name
    song_name, artist_name = from_file(@file_name)

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    @file_name = file_name
    song_name, artist_name = from_file(@file_name)

    song = self.create
    song.name = @song_name
    song.artist_name = @artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
