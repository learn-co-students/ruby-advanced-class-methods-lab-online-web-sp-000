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
    return song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    @@all.push(song)
    return(song)
  end

  def self.find_by_name(name)
    @@all.each do |x|
      if x.name == name
        return x
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    find_song = Song.find_by_name(name)
    if find_song != nil
      return find_song
    else
      new_song = Song.create_by_name(name)
      return new_song
    end
  end

  def self.alphabetical
    return @@all.sort_by do |x|
      x.name
    end
  end

  # Taylor Swift - Blank Space.mp3
  def self.new_from_filename(mp3)
    new = mp3.chomp(".mp3")
    new_mp3 = new.split("-")
    new_mp3.each do |x|
      x.strip!
    end

    artist_name = new_mp3[0]
    song_name = new_mp3[1]

    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(mp)
    file = mp.chomp(".mp3")
    new_file = file.split("-")
    new_file.each do |x|
      x.strip!
    end

    artist_name = new_file[0]
    song_name = new_file[1]

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song

  end

  def self.destroy_all
    @@all = []
  end
end
