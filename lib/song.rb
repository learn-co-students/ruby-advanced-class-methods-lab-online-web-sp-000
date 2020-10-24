require 'pry'
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
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    # self.all << song
    return song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
    # self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song_ary = []
    new_song_ary = filename.split(/[-.]/)
    song = self.new_by_name(new_song_ary[1].strip)
    song.artist_name = new_song_ary[0].strip
    return song
  end

  def self.create_from_filename(filename)
    new_song_ary = []
    new_song_ary = filename.split(/[-.]/)
    song = self.create_by_name(new_song_ary[1].strip)
    song.artist_name = new_song_ary[0].strip
    return song
  end

  def self.destroy_all
    self.all.clear
  end

end
