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
  	return song
  end

  def self.new_by_name(name)
  	song = Song.new
  	song.name = name
  	return song
  end

  def self.create_by_name(name)
  	song = Song.new
  	song.name = name
  	self.all << song
  	return song
  end

  def self.find_by_name(name)
  	self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
  	self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
  	file_name = file_name.sub!(".mp3", "")
  	file_name = file_name.split(" - ")
  	song = self.find_or_create_by_name(file_name[1])
  	song.artist_name = file_name[0]
  	song
  end

  def self.create_from_filename(file_name)
  	file_name = file_name.sub!(".mp3", "")
  	file_name = file_name.split(" - ")
  	song = self.find_or_create_by_name(file_name[1])
  	song.artist_name = file_name[0]
  	song
  end

  def self.destroy_all
  	@@all.clear
  end

end
