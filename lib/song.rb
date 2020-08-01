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
    newSong = Song.new
    newSong.save
    return newSong
  end

  def self.new_by_name(name)
    newSong = Song.new
    newSong.name=(name)
    return newSong
  end

  def self.create_by_name(name)
    newSong = Song.new
    newSong.name=(name)
    newSong.save
    return newSong
  end

  def self.find_by_name(name)
    @@all.find{ | songName | name == songName.name}
  end

  def self.find_or_create_by_name(name)
    hasAlready = false
    @@all.each do | song |
      if (song.name == name)
        hasAlready = true
      end
    end
    if (hasAlready)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename( filename )
    newSong = Song.new
    fileNameArray = filename.split(" - ")
    #binding.pry
    newSong.artist_name=fileNameArray[0]
    fileNameArray[1] = fileNameArray[1].split(".")
    newSong.name=fileNameArray[1][0]
    return newSong
  end

  def self.create_from_filename( filename )
    newSong = Song.new
    fileNameArray = filename.split(" - ")
    #binding.pry
    newSong.artist_name=fileNameArray[0]
    fileNameArray[1] = fileNameArray[1].split(".")
    newSong.name=fileNameArray[1][0]
    newSong.save
    return newSong
  end

  def self.alphabetical
    i = 0
    rArray = []
    songArray = @@all
    topValue = @@all.length
    until (i == topValue) do
      first = "zzz"
      chosen = ""
      songArray.each do | song |
        if (song.name < first)
          first = song.name
          chosen = song
        end
      end
      rArray << chosen
      i = i + 1
      deleteVal = self.find_by_name(first)
      songArray.delete(deleteVal)
    end
    return rArray
  end

end
