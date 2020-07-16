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
    tune = Song.new
    Song.all << tune
    tune
  end
  
  def self.new_by_name(name)
    tune = Song.new
    tune.name = name
    tune
  end
  
  def self.create_by_name(name)
    tune = Song.new
    tune.name = name
    Song.all << tune
    tune
  end
  
  def self.find_by_name(title)
    if Song.all.any? {|song| song.name == title}
      Song.all.each do |song|
        if song.name == title
          return song
        end
      end
    else
      nil
    end
  end
  
  def self.find_or_create_by_name(title)
    if !Song.find_by_name(title)
      Song.create_by_name(title)
    else
      Song.find_by_name(title)
    end
  end
  
  def self.alphabetical
    Song.all.sort_by {|title| title.name}
  end
  
  def self.new_from_filename(file)
    file.delete_suffix!(".mp3")
    file_array = file.split(" - ")
    mp3 = Song.new
    mp3.artist_name = file_array[0]
    mp3.name = file_array[1]
    mp3
  end
  
  def self.create_from_filename(file)
    mp3 = Song.new_from_filename(file)
    Song.all << mp3
  end
  
  def self.destroy_all
    Song.all.clear
  end

end
