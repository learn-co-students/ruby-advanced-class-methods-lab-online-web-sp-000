a = "blah - boop.mp3"
array = a.split(" - ")
artist_name = array[0]
puts array[1].slice!(".mp3")
song_name = array[1]

puts artist_name
puts song_name