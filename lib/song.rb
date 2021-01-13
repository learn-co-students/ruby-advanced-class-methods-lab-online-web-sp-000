require'pry'

class Song_Class_Methods
  attr_accessor :name, :artist_name
   Song = ""

def self.create(name, artist_name) 
  # describe '.create' do
  #   it 'instantiates and saves the song, and it returns the new song that was created' do
  
#new_Song = self.new 
 song = Song.create 
 end
 
 
def initialize(name, artist_name)
  @name = name 
  @artist_name = artist_name 
  self.class.all << self 
end 



  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.name
  
end 


def self.artist_name 
  
end 

def self.find_or_create_by_name(name)
  #it 'invokes .find_by_name and .create_by_name instead of repeating code' do
  end 
end 




