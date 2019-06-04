class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

#this part creates a new song and saves to the Song.all part
  def self.create
    song = self.new
    song.save
    song
  end
#this i guess does it again with a name?
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
#just the song name
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|s| s.name == song_name}
  end
#prevents dupes by looking for the song or making one
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
#sort by Enumerator
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
#pull by filename. splits things on other side of - breaks down to array 0 = TS and 1 Blank
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
end
#this clears out the @@all array where all this is stored
  def self.destroy_all
    self.all.clear
end

end
