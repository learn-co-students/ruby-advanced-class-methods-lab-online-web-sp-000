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
    s = Song.new
    s.save
    s
  end

  def self.new_by_name(name)
    n = Song.new
    n.name = name
    n
  end

  def self.create_by_name(name)
     n = Song.new
     n.name = name
     n.save
     n
  end

  def self.find_by_name(name)
    song_name = nil
    @@all.each do |song|
      if song.name == name
          song_name = song
      end
    end
    song_name
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
        find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end

  def self.new_from_filename(mp3)
    new = mp3.chomp(".mp3")
    new_mp3 = new.split("-")
    new_mp3.each do |x|
      x.strip!
    end

    artist_name = new_mp3[0] 
    song_name = new_mp3[1] 

    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(mp)
    file = mp.chomp(".mp3")
    new_file = file.split("-")
    new_file.each do |x|
      x.strip!
    end

    artist_name = new_file[0]
    song_name = new_file[1]

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song

  end

  def self.destroy_all
    @@all = []
  end
end
