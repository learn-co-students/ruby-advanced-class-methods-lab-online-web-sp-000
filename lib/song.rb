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
    song
  end

  def self.new_by_name(songname)
    song = self.new
    song.name = songname
    song
  end

  def self.create_by_name(songname)
    song = self.new
    song.name = songname
    song.save
    song
  end

  def self.find_by_name(songname)
    @@all.find{|song| song.name == songname}
  end

  def self.find_or_create_by_name(songname)
    if Song.find_by_name(songname) != nil
        Song.find_by_name(songname)
    else
        Song.create_by_name(songname)
    end
  end

  def self.alphabetical
     @@all.sort_by do |song|
         song.name
     end
  end

  def self.new_from_filename(filename)
    s = filename.split(" - ")
    song = self.new
    song.name = s[1].sub(/.mp3/,"")
    song.artist_name = s[0]
    song
  end

  def self.create_from_filename(filename)
    s = filename.split(" - ")
    song = self.new
    song.name = s[1].sub(/.mp3/,"")
    song.artist_name = s[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
