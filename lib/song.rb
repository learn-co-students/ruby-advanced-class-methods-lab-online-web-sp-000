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
    s = self.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new_by_name(name)
    s.save
    s
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    s = self.new
    data = filename.split(" - ")
    s.artist_name = data[0]
    s.name = data[1].chomp(".mp3")
    s
  end

  def self.create_from_filename(filename)
    s = self.new_from_filename(filename)
    s.save
    s
  end

  def self.destroy_all
    self.all.clear
  end
end
