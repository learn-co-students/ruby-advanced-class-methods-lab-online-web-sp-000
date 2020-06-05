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
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    search_result = self.all.find {|p| p.name == title}
    search_result
  end

  def self.find_or_create_by_name(title)
    search_result = self.find_by_name(title)
      if search_result then
      return search_result
      else
        self.create_by_name(title)
      end
    end

  def self.alphabetical
    sort_result = self.all.sort_by {|song| song.name}
    sort_result
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
   new_file = self.new_from_filename(filename)
   song = self.create
   song.name = new_file.name
   song.artist_name = new_file.artist_name
   song
  end

  def self.destroy_all
    self.all.clear
  end

end
