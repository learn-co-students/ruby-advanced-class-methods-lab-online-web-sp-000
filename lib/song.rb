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
    create_self = self.new
    create_self.save
    create_self
  end
  
  #.new
   
   def self.new_by_name(new_song)
     song = self.new
     song.name = new_song
     song
     #takes a string, makes it into an instance variable
     #instantiate a song with a name property
     #returns song variable
    end

  def self.create_by_name(name)
    #name  #takes in string name of a song - name
    #returns a song instance with that name set as its name property and the song. Instance variable??
    # @@all << @name #saves to @@all class variable -- @@all << new thing
  end
 
  def self.find_by_name(name)
    @@all.find {|n| n.name == name}
  end
  
  def self.alphabetical
    @@all.sort_by {|a, b| a <=> b}
  end
  
  def self.destroy_all
    self.all.clear
  end
end
