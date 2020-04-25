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
   def self.create_by_name(create_song)
    song = self.new
    song.name = create_song
    song.save
    song
  end
  def self.find_by_name(song_name)
     self.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(title)
    if !self.find_by_name(title)
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  def self.new_from_filename(filename)
    file_array= filename.split(/ - /)
    file_array[1] = file_array[1].chomp(".mp3")
    song =self.new
    song.artist_name = file_array[0]
    song.name = file_array[1]
    song
  end
  def self.create_from_filename(filename)
    file_array= filename.split(/ - /)
    file_array[1] = file_array[1].chomp(".mp3")
    song =self.new
    song.artist_name = file_array[0]
    song.name = file_array[1]
    song.save
    song
  end
  def self.destroy_all
    self.all.clear
  end
end
