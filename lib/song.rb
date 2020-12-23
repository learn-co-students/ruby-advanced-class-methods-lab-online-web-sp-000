class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.create
    
    song = self.new
    @@all << song
    song
    
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    
    @@all.each do |song|
      if(song.name == name)
        return song
      end
    end
    return nil
    
  end
  
  def self.find_or_create_by_name(name)
    
    if(find_by_name(name))
      song = find_by_name(name)
    else
      song = create_by_name(name)
    end
    
    return song
    
  end
  
  def self.alphabetical
    
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(file_name)
    
    file_arr = file_name.gsub(".mp3", "").split(" - ")
    
    new_song = new_by_name(file_arr[1])
    new_song.artist_name = file_arr[0]
    
    new_song
  end

  def self.create_from_filename(file_name)
    
    file_arr = file_name.gsub(".mp3", "").split(" - ")
    
    new_song = create_by_name(file_arr[1])
    new_song.artist_name = file_arr[0]
    
  end
  
  def self.destroy_all
    
    @@all.clear
    
  end

end
