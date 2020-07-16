require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  def self.create
    new.tap {|a| a.save}
  end

  def self.new_by_name(song)
    new.tap {|a| a.name = song}
  end

  def self.create_by_name(song)
    new.tap {|a| a.save && a.name = song}
  end

  def self.find_by_name(song)
    @@all.detect {|x| x if x.name == song}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(arg)
    var = arg.split(%r{\W\-\W|.mp3})
    v1 = self.new
    v1.artist_name = var[0]
    v1.name = var[1]
    v1
  end

  def self.create_from_filename(arg)
    var = arg.split(%r{\W\-\W|.mp3})
     v1 = self.new
     v1.artist_name = var[0]
     v1.name = var[1]
     v1.save
  end
  def self.destroy_all
    self.all.clear
  end
end
