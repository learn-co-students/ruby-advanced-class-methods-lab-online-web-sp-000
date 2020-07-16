class Song

  attr_accessor :name, :artist_name
  @@all = []

  #CALL AN INSTANCE METHOD W/IN CLASS METHOD
  #def self.class_method
       #a = A.new
       #a.instance_method
    #end

  def self.create
    instance = self.new
    instance.save
    instance
  end

  def self.new_by_name(input_name)
    #@name = input_name
    instance = self.new
    instance.name = input_name
    instance
  end

  def self.new_from_filename(song_title)
    #@name = input_name
    instance = self.new
    split_array = song_title.split(" - ")

    instance.name = split_array[1][0..-5]
    instance.artist_name = split_array[0]
    instance
  end

  def self.create_from_filename(song_title)
    #@name = input_name
    instance = self.new
    split_array = song_title.split(" - ")

    instance.name = split_array[1][0..-5]
    instance.artist_name = split_array[0]
    instance.save
    instance
  end

  def self.create_by_name(input_name)
    #@name = input_name
    instance = self.new
    instance.name = input_name
    instance.save
    instance
  end

  def self.find_by_name(input_name)
    @@all.each { |song|
      if song.name == input_name
        return song
      end
      }
      return nil
    end

    def self.find_or_create_by_name(input_name)
      return find_by_name(input_name) if find_by_name(input_name) != nil
      return create_by_name(input_name) if find_by_name(input_name) == nil
    end


  def self.all
    @@all
  end

  def self.alphabetical
    @@all.sort {|a, b|
      a.name <=> b.name
    }
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

end
