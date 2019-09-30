class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    song.save
    song
  end
  
  def Song.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def Song.create_by_name(new_song_string)
    song = self.new
    song.name = new_song_string
    song.save
    song
  end
  
  def Song.find_by_name(song_string)
    self.all.find{|x| x.name == song_string}
  end
  
  def Song.find_or_create_by_name(string_for_song)
    self.find_by_name(string_for_song) || self.create_by_name(string_for_song)
end

def Song.alphabetical
  @@all.sort_by{|x| x.name}
end

def Song.new_from_filename(filename)
    song = self.new 
    song.name = filename.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    song.artist_name = filename.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song
end

def Song.create_from_filename(filename)
    song = self.new 
    song.name = filename.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    song.artist_name = filename.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song.save
    song
end

def Song.destroy_all
  self.all.clear
end

end
