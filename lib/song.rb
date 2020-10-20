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

  def self.find_by_name(name)
    Song.all.each do |song|
      if (song.name == name)
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if(song == nil)
      create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    newSong = Song.new
    songname = filename.delete_suffix(".mp3")
    sngnm_arr = songname.split(" - ")
    puts "name" + sngnm_arr[1] +" artist "+sngnm_arr[0]
    newSong.name = sngnm_arr[1]
    newSong.artist_name = sngnm_arr[0]
    newSong
  end

  def self.create_from_filename(filename)
    newSong = Song.new
    songname = filename.delete_suffix(".mp3")
    sngnm_arr = songname.split(" - ")
    puts "name" + sngnm_arr[1] +" artist "+sngnm_arr[0]
    newSong.name = sngnm_arr[1]
    newSong.artist_name = sngnm_arr[0]
    newSong.save
    newSong
  end

  def self.destroy_all
    Song.all.clear
  end
end

Song
