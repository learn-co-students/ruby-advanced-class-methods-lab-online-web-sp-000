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
    song = self.new #initializes the new song
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(name)
    result = self.all.detect {|song| song.name == name}
    result

  end

  def self.find_or_create_by_name (title)
    #either return a matching song instance with that name
    result = self.find_by_name (title)
    if  result
      result
    else
      self.create_by_name (title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    #("Thundercat - For Love I Come.mp3")
    split_file_name = file_name.split(" - ")
    artist_name = split_file_name[0]
    song_name = split_file_name[1].gsub(".mp3", "")
    # the constructor should return a new Song instance with the song name set to Blank Space and the artist_name set to Taylor Swift. T
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    #Song.create_from_filename class method should not only parse the filename correctly but should also save the Song instance that was created.
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
