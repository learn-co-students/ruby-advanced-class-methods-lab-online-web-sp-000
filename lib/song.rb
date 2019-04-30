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
    new.save
    all.last
  end
  
  def self.new_by_name(song_name)
    song = new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    all.each do |song|
      if song.name == song_name
        return song
      end
    end
    nil
  end
  
  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name)
      find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    all.sort_by { |s| s.name }
  end
  
  def self.new_from_filename(filename)
    song = new
    split_name = filename.split(" - ")
    song.artist_name = split_name.first
    song.name = split_name.last.split(".").first
    song
  end
  
  def self.create_from_filename(filename)
    song = create
    split_name = filename.split(" - ")
    song.artist_name = split_name.first
    song.name = split_name.last.split(".").first
    song
  end
  
  def self.destroy_all
    all.clear
  end
end

