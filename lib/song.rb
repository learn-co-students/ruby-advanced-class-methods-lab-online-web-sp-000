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
    @@all << self
    return self
end

  def self.new_by_name(name)
    @@all.find {|person| person.name == name}
end
end
