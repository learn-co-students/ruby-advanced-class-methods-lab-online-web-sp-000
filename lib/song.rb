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
    self.all.detect {|t| t.name == title}
  end

  def self.find_or_create_by_name(title)
      if find_by_name(title)
        return find_by_name(title)
      else
         create_by_name(title)
      end
    end

  def self.alphabetical
    all.sort_by {|s| s.name}
  end

  def self.new_from_filename(string)
     array = string.split(" - ")
     song = new_by_name(array[1].chomp(".mp3"))
     song.artist_name = array[0]
     song
  end

  def self.create_from_filename(string)
    final = new_from_filename(string)
    song = create_by_name(final.name)
    song.artist_name = final.artist_name
  end

  def self.destroy_all
    self.all.clear
  end
end
