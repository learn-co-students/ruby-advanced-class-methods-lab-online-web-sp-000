require'pry'

class Song
  attr_accessor :name, :artist_name

def self.create
  new_song = Song.new 
  new_song.save 
  #to call the save method down below 
  new_song 
  #to return the new song per the test 
end 
 
 
def self.new_by_name(name)
 new_song = Song.new
    #we are using new_song instead of Song because we earlier changed the value to new_song 
    new_song.name = name 
    #.name here relates to the attr_accessor name, not a method variable
    #we are passing in the argument here 
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
  binding.pry 
   new_song = Song.new
  @@all.find {|name| new_song.name == name}
  binding.pry 
  end 
end



def self.find_or_create_by_name(name)
  #it 'invokes .find_by_name and .create_by_name instead of repeating code' do
   new_song = Song.new
  if new_song.find_by_name
    puts new_song.name
  else 
    new_song.create_by_name
    end 
  end 



 
# results of last binding.pry 

# [1] pry(Song)> name
# => "Hello"
# [2] pry(Song)> new_song
# => nil
# [3] pry(Song)> Song.new
# => #<Song:0x0000000001381160>
# [4] pry(Song)> new_song.name
# NoMethodError: undefined method `name' for nil:NilClass
# from (pry):4:in `find_by_name'
# [5] pry(Song)>

