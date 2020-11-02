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
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    answer = self.all.detect {|s| s.name == title}
    answer
  end

  def self.find_or_create_by_name(title)
    answer = self.find_by_name(title)
    if answer
      answer
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    finished = self.all.sort_by {|s| s.name}
    finished
  end

  def self.new_from_filename(filename)
    row = filename.split(" - ")
    row[1] = row[1].chomp(".mp3")
    song = self.new
    song.name = row[1]
    song.artist_name = row[0]
    song
  end

  def self.create_from_filename(filename)
    answer = self.new_from_filename(filename)
    song = self.create
    song.name = answer.name
    song.artist_name = answer.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
  

end
