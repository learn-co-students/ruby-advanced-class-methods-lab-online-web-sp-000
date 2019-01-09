class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
    song = self.new
    @@all << song
    return song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end
  def self.all
    @@all
  end
  def self.find_by_name(name)
    @@all.find{|s| s.name == name}
  end
  def self.find_or_create_by_name(name)
    songs = self.find_by_name(name)
    if (songs != nil)
      return songs
    else
      self.create_by_name(name)
    end
  end
  def save
    self.class.all << self
  end
  def self.alphabetical
    sorted = @@all.sort_by { |song| song.name }
    return sorted
  end
  def self.new_from_filename(file_name)
    song = self.new
    parsed = file_name.split(/-/)
    parsed2 = parsed[1].split('.')
    song.name = parsed2[0].strip
    song.artist_name = parsed[0].strip
    return song
  end
  def self.create_from_filename(file_name)
    song = self.new
    parsed = file_name.split(/-/)
    parsed2 = parsed[1].split('.')
    song.name = parsed2[0].strip
    song.artist_name = parsed[0].strip
    @@all << song
    return song
  end
  def self.destroy_all
    self.all.clear
  end
end
