require "pry"
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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end # newbyname

  def self.new_by_name_and_artist(name, artist)
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end # newbyname


  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    search = @@all.find{|song| song.name == name}
    search
  end # findbyname

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil

      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end # method

  def self.alphabetical
    sorted = @@all
    sorted = @@all.sort do |a, b|
      a.name <=> b.name
    end #iterator
    sorted
  end #method#

  def self.destroy_all
    @@all = []
  end #method

  def self.new_from_filename(filename)
    filename_nomp3 = filename.chomp('.mp3')
    filename_array = filename_nomp3.split(" - ")
    name = filename_array[1]
    artist = filename_array[0]
    puts "#{name} #{artist}"
    self.new_by_name_and_artist(name, artist)
  end # method

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end # method

end # end of class
