class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end


  def self.create
    song = self.new
    @@all << song
    song
  end

def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

def self.create_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  song
end

def self.find_by_name(name)
  song = @@all.find {|song| song.name == name }
  song
end

def self.find_or_create_by_name(title)
  find_song = self.find_by_name(title)
  if find_song
    return find_song
  else
    song = self.create_by_name(title)
    song
  end
end

def self.alphabetical
result = self.all.sort_by { |song| song.name }
result
end

def self.new_from_filename(filename)
  song_file = filename.split(" - ")
  song_file[1] = song_file[1].chomp(".mp3")
  song = self.new
  song.name = song_file[1]
  song.artist_name = song_file[0]
  song
end

def self.create_from_filename(filename)
  song_file = self.new_from_filename(filename)
  song = self.create
  song.name = song_file.name
  song.artist_name = song_file.artist_name
  song
end

  def save
    self.class.all << self
  end

  def self.destroy_all
      self.all.clear
    end

end
