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
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    return new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    return new_song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    finder = find_by_name(name)
    if finder != nil
      finder
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|title| title.name}
  end

  def self.new_from_filename(filename)
    new_song = self.new
    song_artist =  filename.split(" - ")[0]
    song_title = filename.split(/\s[\-.]\s|[.]/)[1]
    new_song.name = song_title
    new_song.artist_name = song_artist
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new
    song_artist =  filename.split(" - ")[0]
    song_title = filename.split(/\s[\-.]\s|[.]/)[1]
    new_song.name = song_title
    new_song.artist_name = song_artist
    @@all << new_song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
