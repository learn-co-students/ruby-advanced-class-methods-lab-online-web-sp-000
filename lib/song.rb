require 'pry'
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
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    
    if self.find_by_name(name) 
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort do |inst1, inst2|
      inst1.name <=> inst2.name   
    end
  end

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    artist_name = file_array[0]
    name = file_array[1].chomp(".mp3")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
