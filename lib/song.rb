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
    s = self.new
    s.save
    return s
  end

  def self.new_by_name(name_of_the_song)
      s = self.new
      s.name = name_of_the_song
      return s
  end

  def self.create_by_name(name_of_the_song)
      s = self.new
      s.name = name_of_the_song
      s.save
      return s
  end

  def self.find_by_name(name_of_the_song)
    self.all.detect {|n| n.name == name_of_the_song}
  end

  def self.find_or_create_by_name(name_of_the_song)
    if self.find_by_name(name_of_the_song) == nil

       self.create_by_name(name_of_the_song)
    else
      self.find_by_name(name_of_the_song)
    end
  end

  def self.alphabetical
      self.all.sort_by { |x| x.name}
  end
 def self.new_from_filename(mp3)
    s = self.new
    s.name = mp3.split(/[^a-zA-Z\s]|\s-\s/)[1]
    s.artist_name = mp3.split(/[^a-zA-Z\s]|\s-\s/)[0]
    s
end

  def self.create_from_filename(mp3)
    s = self.new
    s.name = mp3.split(/[^a-zA-Z\s]|\s-\s/)[1]
    s.artist_name = mp3.split(/[^a-zA-Z\s]|\s-\s/)[0]
    s.save
    s
  end

  def self.destroy_all
    self.all.clear
  end

end
