class Song
  
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    all << self
  end
  
  def self.create
    song = self.new
    all << song
    song
  end
  
  def self.new_by_name(song_name)
    s = Song.new
    s.name = song_name
    s
  end
  
  def self.create_by_name(name)
    song = new_by_name(name)
    all << song
    song
  end
  
  def self.find_by_name(name)
    all.find { |i| i.name == name }
  end
  
  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if song
      return song
    else
      create_by_name(name)
    end
  end
  
  def self.alphabetical
    all.sort { |a,b| a.name <=> b.name }
  end
  
  def self.new_from_filename(filename)
    artist_name = filename.split(/\s[-]\s/)[0].strip
    song_name = filename.split(/\s[-]\s/)[1].split(/[.]/)[0].strip
    s = self.new
    s.artist_name = artist_name
    s.name = song_name
    s
  end
  
  def self.create_from_filename(filename)
    s = new_from_filename(filename)
    all << s
    s
  end
  
  def self.destroy_all
    all.clear
  end
    

end
