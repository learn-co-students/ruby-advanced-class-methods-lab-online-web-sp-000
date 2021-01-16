class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    @@all << new_song
    return new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    return new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    @@all << new_song
    return new_song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    if found_song
      return found_song
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    return @@all.sort_by { |a| a.name }
  end

  def self.new_from_filename(format)
    file_array = format.split(/[-.]/)
    artist_name = file_array[0].strip
    name = file_array[1].strip
    new_song = self.new
    new_song.name = name
    new_song.artist_name = artist_name
    return new_song
  end

  def self.create_from_filename(format)
    new_song = self.new_from_filename(format)
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
