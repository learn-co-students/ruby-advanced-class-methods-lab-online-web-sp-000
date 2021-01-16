 require'pry'

class Song
  @@all = []
  attr_accessor :name, :artist_name

def self.create
  new_song = Song.new 
  new_song.save 
  #to call the save method down below 
  new_song 
  #to return the new song per the test  
end 
 
 
def Song.new_by_name(name)
 new_song = Song.new
    #we are using new_song instead of Song because we earlier changed the value to new_song 
 new_song.name = name 
 #we are passing in the argument  
 new_song
end

def self.create_by_name(name)
  new_song = Song.new
  new_song.name = name
  new_song.save 
    new_song
end 


  def self.all
    @@all
  end 

  def save
    self.class.all << self
  end



def self.find_by_name(name)
  #name is Hello
  new_song = Song.new
  new_song.name = name
   @@all.find {|song| 
    song.name == name
   }
     #this statement returns true or false, not a value
end


def self.find_or_create_by_name(name) 
    self.find_by_name(name) ||  self.create_by_name(name) 
    end 
    
    
def self.alphabetical(name)
  #@@all.each do
    #name.sort       undefined method `sort' for "Song":String
  #self.all.sort_by{|name| %w[1]}
  #Song.name.sort_by{|name| %w[1]}
  #sorted = Song.sort_by { |w| w[0]}      Song is string, not array 
   #name.sort_by{|name| %w[1]}
   #@name.sort_by{|name| %w[1]}     name evaluated to nil class 
   #self.all.sort       comparison of Song with Song failed
   @@all.sort
 end 