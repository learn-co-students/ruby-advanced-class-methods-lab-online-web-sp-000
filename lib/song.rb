class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self  #self in a method refers to an instance
  end

  def self.create
    @song = Song.new
    @@all << @song
    return @song
  end

  def self.new_by_name(title)
    @song = self.new
    @song.name = title
    return @song
  end

  def self.create_by_name(title)
      @song = self.new
      @song.name = title
      @@all << @song
      return @song
  end

  def self.find_by_name(title)
    @@all.find do |song|
      if song.name == title
        return song
      end
    end
  end

  def self.find_or_create_by_name(title)
    song = self.find_by_name(title)

    if song == nil
      song = self.create_by_name(title)
      return song
    else
      return song
    end
  end

  def self.alphabetical
    @@all.sort_by do |title|
      title.name
    end
  end

  def self.new_from_filename(input)
    #"Taylor Swift - Blank Space.mp3"
    name_split = input.split(" - ")[1].chomp(".mp3")
    artist_split = input.split(" - ")[0]

    @song = self.new
    @song.name = name_split
    @song.artist_name = artist_split

    return @song
  end

  def self.create_from_filename(input)
    #"Taylor Swift - Blank Space.mp3"
    name_split = input.split(" - ")[1].chomp(".mp3")
    artist_split = input.split(" - ")[0]

    @song = self.new
    @song.name = name_split
    @song.artist_name = artist_split

    @@all << @song
    return @song
  end

  def self.destroy_all
    @@all = []
  end

end
