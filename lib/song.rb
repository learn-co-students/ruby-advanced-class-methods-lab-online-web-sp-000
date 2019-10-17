class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    item = Song.new
    @@all << item
    item
  end
  
  def self.new_by_name(name)
    item = Song.new
    item.name = name
    item
  end

  def self.create_by_name(name)
    item = new_by_name(name)
    @@all << item
    item
  end
  
  def self.find_by_name(name)
    @@all.each { |song| return song if song.name == name  }
    return nil
  end
  
  def self.find_or_create_by_name(name)
    item = find_by_name(name)
    item = create_by_name(name) if item.nil?
    item
  end
  
  def self.alphabetical
    @@all.sort_by { |obj| obj.name }
  end
  
  def save
    self.class.all << self
  end

  def self.new_from_filename(file_name)
    parsed = file_name[0,file_name.size - 4]
    parsed = parsed.split("-")
    item = Song.new
    item.artist_name = parsed[0].strip
    item.name = parsed[1].strip
    item
  end

  def self.create_from_filename(file_name)
    item = new_from_filename(file_name)
    @@all << item
    item
  end
  
  def self.destroy_all
    @@all.clear
  end

end
