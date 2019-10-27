class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    if not @@all.include?(name)
      song = self.new
      song.name = name
      @@all << song
      song
    end
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    searched_song = self.find_by_name(name)
    if not @@all.include?(searched_song)
      self.create_by_name(name)
    else
      searched_song
    end
  end

  def self.alphabetical
    @@all.sort_by {|s| s.name}
  end

  def self.new_from_filename(mp3)
    artist_and_song = mp3.gsub(".mp3","").split(" - ")
    song = self.new
    song.artist_name = artist_and_song[0]
    song.name = artist_and_song[1]
    @@all << song
    song
  end

  def self.create_from_filename(mp3)
    artist_and_song = mp3.gsub(".mp3","").split(" - ")
    song = self.new
    song.artist_name = artist_and_song[0]
    song.name = artist_and_song[1]
    song.save
  end

  def self.destroy_all
    @@all.clear
  end


  def save
    self.class.all << self
  end

end
