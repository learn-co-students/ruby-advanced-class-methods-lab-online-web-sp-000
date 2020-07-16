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
    instance = self.new
    instance.save
    return instance
  end

  def self.new_by_name(song_name)
    instance = self.new
    instance.name = song_name
    return instance
  end

  def self.create_by_name(song_name)
    instance = self.new
    instance.name = song_name
    instance.save
    return instance
  end

  def self.find_by_name(song_name)
    self.all.find {|instance| instance.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(song_name)
    name_string = song_name.split(" - ")[1].chomp(".mp3")
    artist_name_string = song_name.split(" - ")[0]

    instance = self.new
    instance.name = name_string
    instance.artist_name = artist_name_string
    return instance
  end

  def self.create_from_filename(song_name)
    name_string = song_name.split(" - ")[1].chomp(".mp3")
    artist_name_string = song_name.split(" - ")[0]

    instance = self.new
    instance.name = name_string
    instance.artist_name = artist_name_string
    @@all << instance
    return instance
  end

  def self.destroy_all
    @@all.clear
  end

end
