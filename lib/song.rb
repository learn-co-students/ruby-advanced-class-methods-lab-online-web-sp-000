class Song

  attr_accessor :name, :artist_name
   @@all = []

   def self.create

     song = self.new
     song.save
     song
   end

   def self.create_by_name(string_name_of_the_song)
     song = self.new
     song.name = string_name_of_the_song
     song.save
     song
   end

   def self.new_by_name(name)
     song = self.new
     song.name = name
     song

   end

   def self.find_by_name(name)
     self.all.detect {|i| i.name == name}
   end

   def self.find_or_create_by_name(name)
     did_i_find_it = self.find_by_name(name)
     if did_i_find_it == nil
         self.create_by_name(name)
     else
       did_i_find_it
     end
   end

   def self.alphabetical
     self.all.sort_by { |x| x.name}
   end

   def self.new_from_filename(mp3)

     song = self.new
     song.name = mp3.split(/[^a-zA-Z\s]|\s-\s/)[1]
     song.artist_name = mp3.split(/[^a-zA-Z\s]|\s-\s/)[0]
     song
   end

   def self.create_from_filename(mp3)
     song = self.new
     song.name = mp3.split(/[^a-zA-Z\s]|\s-\s/)[1]
     song.artist_name = mp3.split(/[^a-zA-Z\s]|\s-\s/)[0]
     song.save
     song
   end

   def self.all
     @@all
   end

   def save
     self.class.all << self
   end

   def self.destroy_all
     self.all.clear
   end

end
