require "pry"
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
    new = self.new
    new.save
    new
  end 
  
  def self.new_by_name(string_name)
    new = self.new 
    new.name = string_name
    new
  end 
  
  def self.create_by_name(string_name)
    new = self.new
    new.name = string_name
    new.save
    new
  end 
  
  def self.find_by_name(string_name)
    @@all.find {|song| song.name == string_name}
  end 
  
  def self.find_or_create_by_name(string_name)
    find_by_name(string_name) || create_by_name(string_name)
    #find_by_name returns song object, which is what you want (originally you had string_name which would return the song string)
  end 
  
  def self.alphabetical
    @@all.sort_by {|title| title.name}
  end
  
  def self.new_from_filename(file)
    remove_end = file.chomp(".mp3")
    final = remove_end.split(" - ")
   
    song = self.new 
    song.name = final [1]
    song.artist_name = final[0]
    song
  end 
  
  def self.create_from_filename(file)
    new_from_filename(file).save
  end 
  
  def self.destroy_all
    @@all.clear
  end 
end