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

  def self.destroy_all
    self.all.clear
  end

  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
      if song == nil
        then song = self.create_by_name(name)
      end
      song
    end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    ## split filename
    song.name = filename.split(' - ')[1].split('.')[0]
    song.artist_name = filename.split(' - ')[0]
    ## drop flie ext
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
    song
  end

end
