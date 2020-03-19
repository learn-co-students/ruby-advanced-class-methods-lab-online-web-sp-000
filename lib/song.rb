class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
     @all = self.new
     self.all << @all
     @all
  end
  def self.new_by_name(name)
      song = self.create
      song.name = name
      song
  end
  def self.create_by_name(name)
    self.new_by_name(name)
  end
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end
 def self.alphabetical
    song_list = []
    songs = []
    @@all.map{|s| song_list << s.name}
    song = song_list.sort
    counter = 0
    while counter < @@all.length
      @@all.map{|s|
        if song[counter] == s.name
          songs << s
        end
     }
     counter += 1
  end
  songs
end

def self.new_from_filename(name)
   split_song = name.split(" - ").join(".")
   split_song_2 = split_song.split(".")
   song = self.create
   song.artist_name = split_song_2[0]
   song.name = split_song_2[1]
   song
end
def self.create_from_filename(file_name)
  self.new_from_filename(file_name)
end
def self.destroy_all
  self.all.clear
end
def self.all
    @@all
  end

end
