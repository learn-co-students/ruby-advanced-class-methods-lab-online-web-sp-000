require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    #Returns array of all Song instances
  end

  def self.create
    s = self.new
    s.save
    s #Returns new instance of Song
  end

  def self.new_by_name(song_name)
    s = self.new
    s.name = song_name
    s
  end

  def self.create_by_name(song_name)
    s = self.new_by_name(song_name)
    s.save
    s
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    s = self.find_by_name(song_name)
    s ||= self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song_obj|
      song_obj.name
    end
  end

  def self.new_from_filename(filename)
    song_data = filename.split(' - ')
    s = self.new
    s.artist_name = song_data[0]
    s.name = song_data[1].chomp(".mp3")
    s
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end
end

Song.create_by_name("Thriller")
Song.create_by_name("Shape of My Heart")
Song.new_from_filename("Depeche Mode - It's No Good.mp3")

binding.pry
