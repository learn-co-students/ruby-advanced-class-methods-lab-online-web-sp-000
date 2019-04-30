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
    new_song = self.new
    @@all << new_song
    new_song
  end 
  
  def name=(name)
    @name = name
  end  
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end  
  
  def self.create_by_name(name)
    new_song = self.new 
    new_song.name = name 
    @@all << new_song
    new_song
  end  

  def self.find_by_name(name)
   @@all.find{|person| person.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil 
      create_by_name(name)
    else
      find_by_name(name)
    end  
  end  
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end 
  
  def artist_name=(artist_name)
    @artist_name = artist_name
  end  
  
  def self.new_from_filename(file)
    info = file.split(" - ")
    artist = info[0]
    name = info[1].gsub(/.mp3/,'')
    
    new_song = self.new
    new_song.artist_name = artist
    new_song.name = name
    
    new_song
    
  end  
  
  def self.create_from_filename(file)
    info = file.split(" - ")
    artist = info[0]
    name = info[1].gsub(/.mp3/,'')
    
    new_song = self.new 
    new_song.artist_name = artist 
    new_song.name = name 
    
    @@all << new_song
  end  
  
  def self.destroy_all
    @@all.clear
  end  

end
