class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    self.create
  end
  
  def self.create
    @@all << self
  end
 
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
end