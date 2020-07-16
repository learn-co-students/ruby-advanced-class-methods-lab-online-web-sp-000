class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end
  #
  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.find_by_name(song)
    @@all.find{|x| x.name == song}
  end

  def self.create_by_name(record)
    song = self.new_by_name(record)
    @@all << song
    song
  end

  def self.find_or_create_by_name(name)
      x = self.find_by_name(name)
      if x
        return x
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song|song.name}
  end

  def self.new_from_filename(mp3)
    arr = mp3.split(" - ")
    name = arr[1].chomp(".mp3")
    artist = arr[0]
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(mp3)
    song = self.new_from_filename(mp3)
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
