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
  	self.all << self.new
  	self.all.last
  end

  def self.new_by_name(new_name)
  	s = self.new
  	s.name = new_name
  	s
  end

  def self.create_by_name(name)
  	s = self.new
  	s.name = name
  	self.all << s 
  	s
  end

  def self.find_by_name(name)
		s = self.all.find do |song|
			song.name == name
		end
  end

  def self.find_or_create_by_name(name)
  	if !!self.find_by_name(name) == false
  		self.create_by_name(name)
		else
			find_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
  	song_info_array = filename.split(/[-.]/)
  	# puts song_info_array
  	name = song_info_array[1]
  	artist_name = song_info_array[0]
  	

  	s = self.new
  	s.name = name.strip
  	s.artist_name = artist_name.strip
  	s
  end

  def self.create_from_filename(filename)
  	self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
  	self.all.clear
  end
end

# song = Song.new_from_filename("Thundercat - For Love I Come.mp3")





