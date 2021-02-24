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
    new_song = Song.new()
    @@all << new_song
    return new_song
  end
  
  def self.new_by_name (name)
    new_song = Song.new
    @name = name
    new_song.name = name
    
    return new_song
  end
  
  def self.create_by_name(name)
    new_song = Song.new
    @name = name
    new_song.name = name
    @@all << new_song
    return new_song
  end
  
  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    
    if song 
      return song
    else
      song = self.create_by_name(name)
      return song 
    end
  end
  
  def self.alphabetical
    self.all.sort_by do |a|
      a.name
    end
  end
  
  def self.new_from_filename(filename)
    song_arr = filename.split(" - ")
    song_arr[1].delete_suffix!(".mp3")
    
    new_song = create_by_name(song_arr[1])
    new_song.artist_name = song_arr[0]
    
    return new_song
  end
  
  def self.create_from_filename (filename)
    self.all << self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end
end
