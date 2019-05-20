class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create    # instantiates and saves the song, and it returns the new song that was created
  
    song = self.new  # instantiates with .new
    song.save        # using instance method save to save song to @@all
    song             # returns 
  end
  
  def self.new_by_name(name) # instantiates a song with a name property
    song = self.new
    song.name = name         # .name is attr_accessor
    song
  end
  
  def self.create_by_name(name) # instantiates and saves a song with a name property
  
    song = self.new
    song.name = name
    song.save           # or @@all << song
    song
  end  
  
  def self.find_by_name(name)    
    
    # can find a song present in @@all by name and returns falsey when a song name is not present in @@all
    
    @@all.find {|song| song.name == name} # .find method 
  end
  
  def self.find_or_create_by_name(name)  
    
    # invokes .find_by_name and .create_by_name instead of repeating code
    # returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
    # creates a new Song object with the provided title if one doesn't already exist
    
    if find_by_name(name)
      return find_by_name(name)
    else
     create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by { |word| word.sort }
    
  end
  
end

