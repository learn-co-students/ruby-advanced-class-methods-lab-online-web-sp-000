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
    song.save
    return song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    return song
  end
  
  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(song_name)
    self.all.find do |song|
       song.name == song_name
    end
  end
    
  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
      
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(str)
    song = self.new
    file = str.chomp(".mp3").split(" - ")
    song.artist_name = file[0] 
    song.name = file[1]
    song    
  end

  def self.create_from_filename(str) 
    song = self.new
    file = str.chomp(".mp3")
    new_file = file.split(" - ")
    song.artist_name = new_file[0] 
    song.name = new_file[1]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end