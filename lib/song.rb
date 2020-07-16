class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.find_by_name(name)
     self.all.detect{|song| song.name == name}
  end
  
   def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end
  
   def save
     self.class.all << self
  end
  
  def self.find_or_create_by_name(name)
     song = self.find_by_name(name)
     if song then
        return song
      else
        self.create_by_name(name)
      end
  end
    
  def self.alphabetical
    @@all.sort_by! { |song| song.name }
  end

  def self.new_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    @@all << new_song
  end

  def self.destroy_all
    @@all = []
  end
end