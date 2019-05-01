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
    self.all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return false
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    name_array = filename.split(/[.-]/)
    song.name = name_array[1].strip
    song.artist_name = name_array[0].strip
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    name_array = filename.split(/[.-]/)
    song.name = name_array[1].strip
    song.artist_name = name_array[0].strip
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

end
