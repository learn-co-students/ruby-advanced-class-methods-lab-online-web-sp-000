require'pry'

class Song
  attr_accessor :name, :artist_name

def self.create
  new_song = Song.new 
end 

 
def initialize
  @name = name 
  @artist_name = artist_name 
  self.class.all << self
end

def new_by_name 
  @name = "Blank Space"
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




