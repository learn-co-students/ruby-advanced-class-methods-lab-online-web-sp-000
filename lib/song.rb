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
    song = self.new #instantiate the song
    song.save #save the song, saving the class, not the instance
    song # returns new song
  end
  
  def self.new_by_name(name)
    song = self.new #instantiate a song with a name
    song.name=name #define name
    song #returns a song instance with the name set 
  end
  
  def self.create_by_name(name)
     song = self.new_by_name(name)
     song.save
     song
    #below this also works
    # song = self.new akes in the name of a song
    # song.name=name define name
    # @@all << song song saved in @@all
    # song #returns a song instance with the name set
  end

  def self.find_by_name(name) 
    self.all.find{|song| song.name == name} #find song in @@all
  end
  
  def self.find_or_create_by_name(name) 
    #if a method serves two purposes you want to branch it into helper methods
     self.find_by_name(name) || self.create_by_name(name)
     #if self.find_by_name(name) #find song
    #   if song
    #     return song
    # else 
    #   self.create_by_name(name) #if not create song
    # end
   end
  #   if song = self.find_by_name(name)
  #     @@all.each do |song|
  #       if song.name == name
  #         return song
  #       end
  #     end
  #   else 
  #     self.create_by_name(name)
  #   end
  # end
  
  def self.alphabetical
  end
  
  def self.new_from_filename
  end

  def self.create_from_filename
  end

  def self.destroy_all
  end
end
