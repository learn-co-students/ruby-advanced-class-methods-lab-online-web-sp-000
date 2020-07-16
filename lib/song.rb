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
    temp = Song.new 
    temp.save
    temp
  end
  
  def self.new_by_name(name)
    temp = Song.new
    temp.name = name 
    temp 
  end
  
  def self.create_by_name(name)
    temp = self.create
    temp.name = name 
    temp 
  end
  
  def self.find_by_name(name)
    @@all.find {|el| el.name == name}
  end
    
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create_by_name(name)
    else 
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    temp = @@all.sort_by { |song| song.name[0] }
    temp
  end
  
  def self.new_from_filename(filename)
    str = filename.split('-')
    temp = self.new_by_name(str[1].gsub(".mp3", "").strip)
    temp.artist_name = str[0].strip
    temp
  end
  
  def self.create_from_filename(filename)
    str = filename.split('-')
    temp = self.create_by_name(str[1].gsub(".mp3", "").strip)
    temp.artist_name = str[0].strip
    temp
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
