class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if !song
      song = self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename_tokens = filename.split(/\s-\s/)
    artist_name = filename_tokens[0]
    song_name = filename_tokens[1].chomp(".mp3")
    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
