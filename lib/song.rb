class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def save
    self.class.all << self
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
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil? == false
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name  }
  end

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    song_no_ext = file_array[1].chomp(".mp3")
    song = self.new
    song.name = song_no_ext
    song.artist_name = file_array[0]
    song
  end

  def self.create_from_filename(file)
    file = self.new_from_filename(file)
    song = self.create
    song.name = file.name
    song.artist_name = file.artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
