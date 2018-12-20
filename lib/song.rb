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
    song = self.new
    song.save
    # @@all << song
     return song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    return song
   
   end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
    
    
    
  end 
  
  def self.find_by_name(name)
    self.all.find{|find_song| find_song.name == name}
    
    
    
  end 
  
   def self.find_or_create_by_name(name) 
     
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
      elsif self.find_by_name(name) == nil
      self.create_by_name(name)
    end 
    
    # if self.find_by_name(name) == nil
    #   self.create_by_name(name)
    # elsif self.find_by_name(name) == name
    #   return song
    # end 
    
    
  end 
  
  def self.alphabetical
   @@all.sort_by { |a| a.name }
  
  end 
  
  def self.new_from_filename(mp3)
    
    sep_mp3 = mp3.split(" - ")
    format_words = [] 
    sep_mp3.collect do |word|
      format_words << word.chomp(".mp3")
    end 
    
    song = self.new 
    song.name = format_words[1] 
    song.artist_name = format_words[0]
    
    
    return song 
    
    
  end 
  
  def self.create_from_filename(mp3)
    sep_mp3 = mp3.split(" - ")
    format_words = [] 
    sep_mp3.collect do |word|
      format_words << word.chomp(".mp3")
    end 
    
    song = self.new 
    song.name = format_words[1] 
    song.artist_name = format_words[0]
    
    song.save
    return song 
  end 
  
  def self.destroy_all 
    self.all.clear
  end 

end
