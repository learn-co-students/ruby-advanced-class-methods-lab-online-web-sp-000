class Song
  attr_accessor :name, :artist_name
  @@all = []



  def self.create
    #instantiates and saves the song
    s = self.new
    s.save

    #returns the new song that was just created
    s
  end

  def self.new_by_name(song_name)
    s = self.new
    s.name = song_name
    s.save
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)

  end

  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end

  def self.new_from_filename(artist_song_name)
    song = self.new
    song.name = (artist_song_name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (artist_song_name.split(" - ")[0])
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end


  def self.all
    #this returns the array of songs
    @@all
  end

  def save
    #this shovels the Song that was just initiated into @@all arrray
    self.class.all << self
  end

end
