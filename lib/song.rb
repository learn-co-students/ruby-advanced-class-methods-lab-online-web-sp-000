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

  def self.new_by_name(string_name)
    string = self.new
    string.name = string_name
    string
  end
  
  def self.create_by_name(string_name)
    string = self.new
    string.name = string_name
    string.save
    string
  end
  
  def self.find_by_name(string_name)
   self.all.find do |title|
     title.name == string_name
  end
  end
  
  def self.find_or_create_by_name(string_name)
    self.find_by_name(string_name) || self.create_by_name(string_name)
  end
  
  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end
  
  def self.new_from_filename(name)
    new_song = self.new
    new_song.name = (name.split(" - ")[1].chomp(".mp3"))
    new_song.artist_name = (name.split(" - ")[0])
    new_song
  end
  
  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
  end
  
  def self.destroy_all 
    self.all.clear
  end
end
