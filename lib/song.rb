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
    @@all << song
    return song
  end
  
    def self.new_by_name(title)
      song = self.new
      song.name = title
      song
    end

    def self.create_by_name(title)
      song = self.new
      song.name = title
      @@all << song
      song
    end
    
    def self.find_by_name(name)
      self.all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      if self.find_by_name(name)
       return self.find_by_name(name)
      else
        song = self.create_by_name(name)
      end
      song
    end

    def self.alphabetical
      self.all.sort_by{|song| song.name}
    end

    def self.new_from_filename(file)
      s = Song.new
      parsed = file.split("-")
      artist = parsed[0].strip
      title = parsed[1].split(".")[0].strip
      s.name = title
      s.artist_name = artist
      s
    end

    def self.create_from_filename(file)
      s = self.create
      parsed = file.split("-")
      artist = parsed[0].strip
      title = parsed[1].split(".")[0].strip
      s.name = title
      s.artist_name = artist
      s
    end
    def self.destroy_all
      @@all.clear
    end
end
