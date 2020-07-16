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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(string_name_of_the_song)
    new_song = self.new
    new_song.name = string_name_of_the_song
    new_song
  end

  def self.create_by_name(string_name_of_the_song)
    new_song = self.new
    new_song.name = string_name_of_the_song
    new_song.save
    new_song
  end

  def self.find_by_name(string_name_of_the_song)
    self.all.find do |title|
      title.name == string_name_of_the_song
    end
  end

  def self.find_or_create_by_name(string_name_of_the_song)
    self.find_by_name(string_name_of_the_song) || self.create_by_name(string_name_of_the_song)
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(name)
    new_song = self.new
    new_song.name = (name.split(" - ")[1].chomp(".mp3"))
    new_song.artist_name = (name.split(" - ")[0])
    new_song
  end

  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
  end

  def self.destroy_all
    self.all.clear
  end

end
