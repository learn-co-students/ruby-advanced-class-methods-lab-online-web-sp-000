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
    newsong = Song.new
    newsong.save
    newsong
  end

  def self.new_by_name(name)
    newsong = Song.new
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    newsong = new_by_name(name)
    newsong.save
    newsong
  end

  def self.find_by_name(name)
    all.select{|n| n.name == name}.first
  end

  def self.find_or_create_by_name(name)
    foundsong = find_by_name(name)
    if foundsong == nil
        foundsong = create_by_name(name)
    end
    foundsong
  end

  def self.alphabetical
    @@all.sort_by{|n| n.name}
  end

  def self.new_from_filename(filename)
    newsong = new_by_name(filename.match(/(?<=- ).*(?=[.][m])/).to_s)
    newsong.artist_name = filename.match(/^([\w\-]+)/).to_s
    newsong
  end

  def self.create_from_filename(filename)
    newsong = create_by_name(filename.match(/(?<=- ).*(?=[.][m])/).to_s)
    newsong.artist_name = filename.match(/^([\w\-]+)/).to_s
    newsong
  end

  def self.destroy_all
    @@all.clear
  end
end
