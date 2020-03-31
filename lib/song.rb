class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # Class Methods

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song.save
    song
  end

  def self.create_by_name(song_title)
    song = self.create
    song.name = song_title
    song
  end

  def self.find_by_name(song_title)
    @@all.find {|song| song.name == song_title}
  end

  def self.find_or_create_by_name(song_title)
    if self.find_by_name(song_title) == nil
      self.create_by_name(song_title)
    else
      self.find_by_name(song_title)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(input)
    artist_and_song = input.split(" - ")
    song_title = artist_and_song[1].delete_suffix('.mp3')
    song = self.new_by_name(song_title)
    song.artist_name = artist_and_song[0]
    song
  end

  def self.create_from_filename(input)
    song = self.new_from_filename(input)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

puts "Hi it's Joel"
