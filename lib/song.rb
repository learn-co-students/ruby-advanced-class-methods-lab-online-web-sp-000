class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def Song.new_by_name(name)
    new_song  = Song.new
    new_song.name = name 
    new_song
  end
  
  def self.create
    new_song  = Song.new 
    
    @@all <<  new_song
    new_song
  end
  
   def Song.create_by_name(name)
    new_song  = Song.new
    new_song.name = name 
    @@all << new_song
    new_song
  end
    
  def Song.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def Song.find_or_create_by_name(name)
    is_created = self.find_by_name(name)
    
    if is_created != nil 
      return is_created
    else
      self.create_by_name(name)
    end
  end
  
  def Song.alphabetical
    @@all.sort_by { |song|
      song.name.downcase
    }
  end
  
  def Song.new_from_filename(file)
    separated = file.split(' - ')
    separated[1].chomp('.mp3')
    
    new_song =self.create_by_name(separated[1].chomp('.mp3'))
    new_song.artist_name = separated[0]
    new_song
  end
  
  def Song.create_from_filename(file)
     separated = file.split(' - ')
    separated[1].chomp('.mp3')
    
    new_song =self.create_by_name(separated[1].chomp('.mp3'))
    new_song.artist_name = separated[0]
    @@all << new_song
    new_song
  end
  
  def Song.destroy_all
    @@all.clear
  end
  
end
