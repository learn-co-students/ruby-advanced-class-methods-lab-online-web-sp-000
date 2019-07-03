class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    s = self.new
    @@all << s
    return s
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    return s
  end

  def self.create_by_name(name)
    s = self.new
    @@all << s
    s.name = name
    return s
  end

  def self.find_by_name(name)
    @@all.find{|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    f = self.find_by_name(name)
    if f != nil && f.name == name
      return f
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
  @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    formatted_name = filename.split("\s-\s")
    song.name = formatted_name[1].chomp(".mp3")
    song.artist_name = formatted_name[0]
    #song.artist_name = song.artist_name.chomp(".mp3")
    song
  end

  def self.create_from_filename(filename)
    s = self.new
    formatted_name = filename.split("\s-\s")
    s.name = formatted_name[1].chomp(".mp3")
    s.artist_name = formatted_name[0]
    @@all << s
  end

  def self.destroy_all
    @@all.clear
  end


end
