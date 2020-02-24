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
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end
  
  def self.create_by_name(string)
    song = self.create
    song.name = string
    song
  end
  
  def self.find_by_name(string)
    output = self.all.find {|song| song.name == string}
    output
  end
  
  def self.find_or_create_by_name(string)
    input = self.find_by_name(string)
    input ? input : self.create_by_name(string)
  end
  
  def self.alphabetical
    sorted_array = self.all.sort_by {|song| song.name}
    sorted_array
  end
  
  def self.new_from_filename(filename)
    #("Thundercat - For Love I Come.mp3")
    name_title_array = (filename.chomp(".mp3").split(" - "))
    song = self.new 
    song.name = name_title_array[1]
    song.artist_name = name_title_array[0]
    song
  end
  
  def self.create_from_filename(filename)
    input = self.new_from_filename(filename)
    song = self.create
    song.name = input.name
    song.artist_name = input.artist_name
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end