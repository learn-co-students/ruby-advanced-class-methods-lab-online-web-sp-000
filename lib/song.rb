class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create # class constructor/method create, creates a new song.
    song = self.new # sets song variable equal to a new song instance.
    self.all << song # adds the new song instance to the @@all array.
    song # returns the new song.
  end

  def self.new_by_name(song_name) # class constructor/method new_by_name, creates a new song instance by name.
    song = self.new # sets song variable equal to a new song instance.
    song.name = song_name # sets the song name to the song_name parameter.
    song # returns the new song.
  end

  def self.create_by_name(song_name) # class constructor/method create_by_name, creates a new song instance by name.
    song = self.create # sets song variable equal to a new song instance using the self.create method previously defined.
    song.name = song_name # sets the song name to the song_name parameter.
    song # returns the new song.
  end

  def self.find_by_name(song_name) # class finder method, finds a song from the song name.
    result = self.all.find{|song| song.name == song_name} # sets the result variable equal to the song searched for.
    result # returns the found song.
  end

  def self.find_or_create_by_name(song_name) # class finder method, finds a song based on a name or creates a song based on a name.
    result = self.find_by_name(song_name) # sets the result variable equal to the previously defined class method find_by_name which returns a song based on a name.
    if result # if the song is found by the name.
      result # return the found song.
    else # if the song isn't found by the name.
      self.create_by_name(song_name) # cretates a new song with that name using the previously defined class methd create_by_name.
    end
  end

  def self.alphabetical # class method alphabetical, returns the songs sorted in alphabetical order by name.
    sorted_songs = self.all.sort_by{|song| song.name} # sets sorted_songs variable equal to an array of the songs sorted alphabetically by name.
    sorted_songs # returns the songs sorted.
  end

  def self.new_from_filename(filename) # class method new_from_filename, returns a song info from the filename.
    new_song_array = filename.split(" - ") # sets variable new_song_array to an array of the given filename split at the " - " part of the filename.
    new_song_array[1] = new_song_array[1].chomp(".mp3") # removes the ".mp3" from the end of the filename.
    song = self.new # sets song variable equal to a new song instance.
    song.name = new_song_array[1] # sets song name to the second part of the new_song_array array.
    song.artist_name = new_song_array[0] # sets song name to the first part of the new_song_array array.
    song # returns the song.
  end

  def self.create_from_filename(filename) # class method create_from_filename, parses the filename and saves the song.
    result = self.new_from_filename(filename) # sets the result variable to the previously defined class method new_from_filename to parse the song filename.
    song = self.create # sets song variable equal to a new song instance using the self.create method previously defined.
    song.name = result.name # sets songs name to the result variables name.
    song.artist_name = result.artist_name # sets the songs artist name to the results rtist name.
    song # returns the song.
  end

  def self.destroy_all # class method destroy_all, resets the state of the @@all class variable to an empty array.
    self.all.clear # clears out the @@all array.
  end

end
