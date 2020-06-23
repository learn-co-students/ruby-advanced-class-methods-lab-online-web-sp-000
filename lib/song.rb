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
    new_song = self.new
    new_song.save
    return new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    return new_song
  end

def self.create_by_name(name)
  new_song = new_by_name(name)
  new_song.save
  return new_song
end

def self.find_by_name(song_name)
    @@all.find {|song|
      song.name == song_name
    }
end

def self.find_or_create_by_name(name)
if find_by_name(name) == nil
  create_by_name(name)
else
  return find_by_name(name)
end
end

def self.alphabetical
  @@all.sort_by{|song| song.name}
end

def self.new_from_filename(filename)

  split_filename = filename.split(" - ")
  new_song = new_by_name(File.basename(split_filename[1], ".mp3"))
  new_song.artist_name = split_filename[0]
  return new_song
end

def self.create_from_filename(filename)
new_from_filename(filename).save
end

def self.destroy_all
  @@all.clear
end

end
