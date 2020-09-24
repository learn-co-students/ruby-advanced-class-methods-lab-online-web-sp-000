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


  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end 

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  #returns false if there is no value 
  def self.find_by_name(song_name)
   @@all.find {|songs| songs.name == song_name}
  end
  
   
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) != nil
      self.find_by_name(song_name)
    elsif self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    end
  end
   
   def self.alphabetical
     all = @@all
     all.sort_by(&:name)
   end
   
   def self.new_from_filename(song_and_name)
     #separating song and artist by " - "
     separate = song_and_name.split(" - ")
     
     #setting the first of the split array to the song artist and turning it into a string
     song_artist = separate[0].to_s
     
     #since song name still has the .mp3 attached, splitting it again by the "."
     song_name = separate[1].split(".")
     
     #taking the first of the newly split array and converting it to a string. this is now the song's name
     song_name = song_name[0].to_s
     
     #now creating our new song
     song = self.new
     song.artist_name = song_artist
     song.name = song_name
     song
   end
   
   def self.create_from_filename(song_and_name)
     #initializing and saving a new song.
     song = self.create
     
     #separating song and artist by " - "
     separate = song_and_name.split(" - ")
     
     #setting the first of the split array to the song artist and turning it into a string
     song_artist = separate[0].to_s
     
     #since song name still has the .mp3 attached, splitting it again by the "."
     song_name = separate[1].split(".")
     
     #taking the first of the newly split array and converting it to a string. this is now the song's name
     song_name = song_name[0].to_s
     
     song.artist_name = song_artist
     song.name = song_name
     song
  end
   
  def self.destroy_all
    @@all.clear
  end
    


end
