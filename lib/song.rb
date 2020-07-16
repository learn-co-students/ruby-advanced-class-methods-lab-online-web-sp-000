class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
   self.class.all << self
 end

  def self.create
    new = self.new
    new.save
    new
  end

  def self.new_by_name(name)
    new = self.new
    new.name = name
    new.save
    new
  end

  def self.create_by_name(name)
    new = self.new
    new.name = name
    new.save
    new
  end

  def self.find_by_name(name)
    @@all.select{|song| song.name == name}.first
  end

  def  self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      self.create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    @@all.sort_by{|x| x.name}
  end

  def self.new_from_filename(file_name)
    new_name = file_name.split("-")
    new = self.new
    new.name = new_name[1].strip.gsub!(".mp3","")
    new.artist_name = new_name[0].strip
    new.save
    new
  end

  def self.create_from_filename(file_name)
    new_name = file_name.split("-")
    new = self.new
    new.name = new_name[1].strip.gsub!(".mp3","")
    new.artist_name = new_name[0].strip
    new.save
    new
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

end
