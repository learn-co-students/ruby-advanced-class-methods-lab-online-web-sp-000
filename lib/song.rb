class Song

  attr_accessor :name, :artist_name, :new_by_name

  @@all = []

  def self.all
    @@all
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if !self.find_by_name(song_name)
      self.create_by_name(song_name)
    else
      self.all.each {|song| return song if song.name == song_name}
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = self.new
    song_data_arr = file_name.split(/\s-\s|\./)
    song.name = song_data_arr[1]
    song.artist_name = song_data_arr[0]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    song_data_arr = file_name.split(/\s-\s|\./)
    song.name = song_data_arr[1]
    song.artist_name = song_data_arr[0]
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
