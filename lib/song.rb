class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    @@all << self.new
    self.new
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
    @@all.find do |d_song|
      d_song.name == name
    end
  end
    
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.uniq.sort_by do |obj| 
      obj.name
    end
  end
  
  def self.new_from_filename(file_name)
    song = self.new
    song.name = ((file_name.split("-"))[1]).chomp(".mp3").strip
    song.artist_name = ((file_name.split("-"))[0]).rstrip
    song
  end
    
  def self.create_from_filename(file_name)
    song = self.new
    song.name = ((file_name.split("-"))[1]).chomp(".mp3").strip
    song.artist_name = ((file_name.split("-"))[0]).rstrip
    @@all << song
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
