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
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |song| song.name == name end
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    if found_song != nil
      found_song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song| song.name end
  end

  def self.new_from_filename(file_name)
    song_array = file_name.gsub!(".mp3", "").split("-")
    song = self.new
    song.name = song_array[1].strip
    song.artist_name = song_array[0].strip
    song
  end

  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    song.save
  end

  def self.destroy_all()
    self.all.clear
  end

end
