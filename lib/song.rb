class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.all
    @@all
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
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song_object| song_object.name == name}
  end

  def self.find_or_create_by_name(name)
    found_by_name = self.find_by_name(name)
    if !found_by_name
      self.create_by_name(name)
    else
      found_by_name
    end
  end

  def self.alphabetical
    self.all.sort_by do |song_object|
      song_object.name
    end
  end

  def self.new_from_filename(filename)
    files = filename.split(" - ")
    artist = files[0]
    song_name = files[1].chomp(".mp3")

    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end

def self.create_from_filename(filename)
  self.new_from_filename(filename).save
end

def self.destroy_all
  self.all.clear
end

end
