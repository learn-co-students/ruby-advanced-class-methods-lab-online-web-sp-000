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
    self.all << song
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
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    songs_alphabetized = self.all.sort { |a, b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    data = filename.split("-")
    song = self.new
    song.artist_name = data[0].strip
    song.name = data[1].slice(1, (data[1].length - 5))
    song
  end

  def self.create_from_filename(filename)
    data = filename.split("-")
    song = self.new
    song.artist_name = data[0].strip
    song.name = data[1].slice(1, (data[1].length - 5))
    self.all << song
    song
  end

  def self.destroy_all
    @@all = []
  end
end
