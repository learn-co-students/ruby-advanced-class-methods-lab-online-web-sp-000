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
    song = self.new_by_name(name)
    song.save
    song
  end 

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
    #Select returns all the instances that are true; Find returns the first
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #Order of operations makes a difference; put the first process first
    #This is cleanest 
    
    #if song = self.find_by_name(name)
     # song #Either this return value
    #else 
    #  self.create_by_name(name) #Or this return value
    #end 
  end 

  def self.alphabetical
    @@all.sort_by {|song| song.name}
    #Don't forget to include the '.name' because you are sorting by name, and putting 'song'
  end 

  def self.new_from_filename(filename)
    file_array = filename.gsub(".mp3", "").split(" - ")
    #Gsub is better than delete, takes two arguments, first one the material to delete, second 
    artist_name = file_array[0]
    name = file_array[1]
    #Assigning variable names to each part of the array
    song = self.new_by_name(name)
    #Use the previous method to instantiate and save time
    song.artist_name = artist_name
    song
  end 

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song 

    #So much cleaner!
  end

  def self.destroy_all
    @@all.clear 
  end 
end
