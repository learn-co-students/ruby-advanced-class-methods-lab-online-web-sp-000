require 'pry'

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
		song = Song.new
		self.all << song
		song
	end

	def self.new_by_name(name)
		song = self.new
		song.name = name
		song
	end

	def self.create_by_name(name)
		song = self.create
		song.name = name
		song
	end

	def self.find_by_name(name)
		song = self.all.find{|song| song.name == name}
		song
	end

	def self.find_or_create_by_name(name)
		song = self.find_by_name(name)
		if song
			song
		else
			self.create_by_name(name)
		end
end

	def self.alphabetical
		song = self.all.sort_by {|song| song.name}
		song
	end

	def self.new_from_filename(filename)
		song_array = filename.split(" - ")
		song_array[1] = song_array[1].chomp(".mp3")
		song = self.new
		song.name = song_array[1]
		song.artist_name = song_array[0]
		song
	end

	def self.create_from_filename(filename)
		result = self.new_from_filename(filename)
		song = self.create
		song.name = result.name
		song.artist_name = result.artist_name
		song
	end

	def self.destroy_all
		self.all.clear
		all
	end


end
