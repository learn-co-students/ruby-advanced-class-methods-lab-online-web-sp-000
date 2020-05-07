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
    song = Song.new
    song.save    
    song
  end

  def self.new_by_name(song_name)
    song_1 = self.new
    song_1.name = song_name
    # Why can't I call .name as a method? I thought the attr_accessor has already created a #name writer method?
    song_1
  end

  def self.create_by_name(song_name)
    song_2 = self.create
    song_2.name = song_name
    song_2
  end

  def self.find_by_name(song_name)
    # self.all.detect {|s| s.name == song_name}  
    @@all.each do |song|
          if song.name == song_name
           return song 
          end
      end
      nil
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
    # if self.find_by_name(song_name)
    #   self.find_by_name(song_name)
    # else
    #   # binding.pry
    #   self.create_by_name(song_name)
    # end
  end

  def self.alphabetical
    @@all.sort_by { |inst| inst.name }
  end

  def self.new_from_filename(file_name)
    split_file_name = file_name.split(" - ")
    split_file_title = split_file_name[1].split(".")
    song = self.new
    song.name = split_file_title[0]
    song.artist_name = split_file_name[0]
    song
    # binding.pry
  end

  def self.create_from_filename(file_name)
    @@all << self.new_from_filename(file_name)
    # binding.pry
  end

  def self.destroy_all
    @@all.clear
  end
end
