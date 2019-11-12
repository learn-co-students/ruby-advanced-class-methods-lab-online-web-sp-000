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
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
    
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end
  
  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    return self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(file)
    parse = file.partition('-')
    artist = parse[0].strip
    name = parse[2].gsub('.mp3', '').strip
    song = self.create_by_name(name)
    song.artist_name = artist
    return song
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file)
  end
  
  def self.destroy_all
    @@all = []
  end
end


Song.create

Song.new_by_name('Blank Space')
