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
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end
    
  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
    
  end
  
  def self.find_by_name(song_name)
    self.all.detect{|specific_song| specific_song.name == song_name}
  end
      
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
        self.find_by_name(song_name)
    else self.create_by_name(song_name)
      
    end
  end 
  
  def self.alphabetical
    self.all.sort{|a,z| a.name <=> z.name}
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.new_from_filename(file_name)
    song_info = file_name.split(%r{[-.]})
    song = Song.new 
    song.artist_name = song_info[0].strip
    song.name = song_info[1].strip
    song
  end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end
  
end
