class Song
  attr_accessor :name, :artist_name, :filename
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
    s = self.create
    s.name = name
    s
  end
  
  def self.create_by_name(name)
    s = self.create
    s.name = name
    s
  end
  
  def self.create_by_artist_name(name, artist_name)
    s = self.create
    s.name = name
    s.artist_name = artist_name
    s
  end

  def self.find_by_name(name)
    self.all.find {|p| p.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      return self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    l = self.all.sort_by {|x, y| x.name}
    l
  end
  
  def self.new_from_filename(filename)
    a = filename.split(" - ")
    artist_name = a[0].to_s
    b = a[1]
    b = b.split(".")
    name = b[0].to_s
    self.create_by_artist_name(name, artist_name)

  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end

end
