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
    song.name = @name
    song.artist_name = @artist_name
    song.save
    song
  end
  
  def self.new_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    song
  end
  
  def self.create_by_name(name_of_song)
    song = self.new_by_name(name_of_song)
    song.save
    song
  end
  
  def self.find_by_name(name_of_song)
    self.all.find {|song| song.name == name_of_song}
  end
  
  def self.find_or_create_by_name(name_of_song)
    if self.find_by_name(name_of_song)
      self.find_by_name(name_of_song)
    else 
      self.create_by_name(name_of_song)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split("-")[0].strip
    song.name = filename.split("-")[1][0..-5].strip
    song
  end
  
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end

end
