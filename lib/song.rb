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
    @@all << song
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
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|jingle| jingle.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|jingle| jingle.name}
  end
  
  def self.new_from_filename(filename)
    slice = filename.slice(0..filename.length - 5)
    song_data = slice.split(" - ")
    song = Song.new
    song.artist_name = song_data[0]
    song.name = song_data[1]
    song
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
  
  def self.destroy_all
    @@all = []
  end
end
