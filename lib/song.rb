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
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
    #result = nil
    #self.all.each do |song|
      #if song.name == name
        #result = song
      #end
    #end
    #result
  #end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split("-")
    artist_name = data[0]
    name = data[1]

    song = self.new
    song.artist_name = artist_name.strip
    song.name = name.strip.chomp(".mp3")
    song
  end

  def self.create_from_filename(filename)
    data = filename.split("-")
    artist_name = data[0]
    name = data[1]

    song = self.new
    song.artist_name = artist_name.strip
    song.name = name.strip.chomp(".mp3")
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
