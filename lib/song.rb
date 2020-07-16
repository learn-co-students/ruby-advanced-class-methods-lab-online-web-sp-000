require 'pry'

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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

 def self.find_or_create_by_name(song_name)
      if self.find_by_name(song_name)
        self.find_by_name(song_name)
      else
        self.create_by_name(song_name)
      end
   #Song.find_or_create_by_name("Dreamstate Emergency") => existing song "Dreamstate Emergency"
   #Song.find_or_create_by_name("Brain Damage") =>  new song"Brain Damage"
 end

 def self.new_from_filename(song)
   new_song = song.split(".") # second element of array is the format
   new_song = new_song[0]
   new_song = new_song.split(" - ")
   song_from_file = self.new
   song_from_file.name = new_song[1]
   song_from_file.artist_name = new_song[0]
   song_from_file
 end

def self.create_from_filename(song)
  new_song = song.split(".") # second element of array is the format
  new_song = new_song[0]
  new_song = new_song.split(" - ")
  song_from_file = self.new
  song_from_file.name = new_song[1]
  song_from_file.artist_name = new_song[0]
  @@all << song_from_file
end

 def self.alphabetical
   @@all.sort_by {|song| song.name}
   #Song.alphabetical => "Object ID Brain Damage", "Object ID Dreamstate Emergency", "Object ID The light That Blinds"
 end

  def self.destroy_all
    @@all.clear
  end
end
