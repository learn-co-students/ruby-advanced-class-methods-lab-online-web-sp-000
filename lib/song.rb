class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
   @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name
    self.all.each do |song|
      song.name = song.name.split(" ").collect{|s| s.capitalize}.join(" ")
    end
  end
end
