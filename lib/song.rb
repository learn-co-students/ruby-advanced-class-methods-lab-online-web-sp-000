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
    self.all << song
    song
  end

  def self.new_by_name(name)
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
    search = self.all.find {|song| song.name == name}
    search
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if song
      song
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    array = self.all.sort_by {|song| song.name}
    array
  end

  def self.new_from_filename(filename)
    data = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song
  end

  def self.create_from_filename(filename)
    data = filename.chomp(".mp3").split(" - ")
    song = self.create
    song.artist_name = data[0]
    song.name = data[1]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
