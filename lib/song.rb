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
    song = self.all.find{ |song| song.name == name }
    if song.nil?
      return nil
    else
      return song
    end
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
      if song.nil?
        create_by_name(name)
      else
        song
      end
  end

  def self.alphabetical
    all.sort{ |first, second| first.name <=> second.name}
  end

  def self.new_from_filename(file_format)
    song = self.new
    break_song = file_format.split("-")
    #get index where . lives
    index = break_song.last.index('.')
    #get string from the beginning to before the . lives
    name = break_song.last[0..index - 1]
    artist = break_song.first
    #remove spaces
    song.name = name.strip
    song.artist_name = artist.strip
    song
  end

  def self.create_from_filename(file_format)
    all << new_from_filename(file_format)
  end

  def self.destroy_all
    all.clear
  end

end
