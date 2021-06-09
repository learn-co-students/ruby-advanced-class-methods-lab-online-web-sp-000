#advanced method syntax
#reviewing with comments!


#creates a song class, given 2 accessors name and artist_name
#@@all keeps track of all of the songs sent to it via the save method (bottom)
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end


#create a new song in the process call save to push it to @@All
  def self.create
    created_song = Song.new
    created_song.save
    created_song
  end

#same as above but with the input of name given to the song
  def self.new_by_name(name)
    new_song_by_name = Song.new
    new_song_by_name.name = name
    new_song_by_name
  end

#same as above combining both elements
  def self.create_by_name(name)
    name_to_life = Song.new
    name_to_life.name = name
    name_to_life.save
    name_to_life
  end


#looks inside of all and uses the find metho to check if any result returns true
#otherwise false
  def self.find_by_name(name)
    @@all.find { |song| song.name == name}
  end


#taking the input of a name check that against @@all, if it returns no match (nil)
#use previous method call of create by name and pass in your name
#else return the match
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

#sorts @@all alphabetically BUT does so by addressing the song names directly as
#instance variables
  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end


#given the specific file input syntax "Taylor Swift - Blank Space.mp3"
#Seperate out the artist and the title, dispose of the mp3 tag
#stores those values as new variables
#using previous methods creates a new instance of that song with the given info

  def self.new_from_filename(name)
    song_split = name.split("-")
    split_artist = song_split[0].strip
    split_name = song_split[1].gsub(".mp3", "").strip

    created_song = Song.new
    created_song.name = split_name
    created_song.artist_name = split_artist
    created_song
  end

#same but saves too by shortcutting and using an above method call on self
  def self.create_from_filename(name)
    song_split = name.split("-")
    split_artist = song_split[0].strip
    split_name = song_split[1].gsub(".mp3", "").strip

    new_song = self.create_by_name(split_name)
    new_song.artist_name = split_artist
  end


#nuke it leroy
  def self.destroy_all
    self.all.clear
  end


#mentioned above, pushes its bum into the @@all array
  def save
    self.class.all << self
  end



end
