
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
    song = Song.new
    self.all << song
    return song
  end 
  
  def self.new_by_name(string)
    song = Song.new
    song.name = string
    return song
  end   
  
  def self.create_by_name(string)
    song = Song.new
    song.name = string
    self.all << song
    return song
  end
  
  def self.find_by_name(string)
    self.all.find {|x| x.name == string}
    #look thru all find a name that matches string
  end 
  
  def self.find_or_create_by_name(string)
    var = self.find_by_name(string)
    if var == nil 
      self.create_by_name(string)
    else
      return var
    end 
  end 
  
  def self.alphabetical
    var = self.all
    var.sort_by{|x| x.name}
  end 

   def self.new_from_filename(filename)
    song = self.new 
    song.name = filename.split(" - ")[1].chomp(".mp3")
    song.artist_name = filename.split(" - ")[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ")[1].chomp(".mp3")
    song.artist_name = filename.split(" - ")[0]
    @@all << song
    song
  end

  def self.destroy_all 
    @@all = [ ]
  end 
end
