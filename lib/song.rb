class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.select{|song| song.name == name}[0]
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    !!found ? found: self.create_by_name(name)
  end

  def save
    @@all << self
  end

  def self.alphabetical
   @@all.sort{|a,b| a.name <=> b.name}
 end

 def self.new_from_filename(file)
  parts = file.split('-')
  artist =  parts[0].strip
  name = parts[1].split('.')[0].strip
  song = Song.create
  song.name = name
  song.artist_name = artist
  song
end

def self.create_from_filename(file)
  song = self.new_from_filename(file)
  song.save
end


end
