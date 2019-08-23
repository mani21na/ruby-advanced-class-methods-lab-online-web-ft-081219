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
    song = self.new
    self.all << song
#inspite of above, using song.save
    song
  end
  
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end
  
  def self.find_by_name(title)
    result = self.all.find {|song| song.name == title}
    result
  end
  
  def self.find_or_create_by_name(title)
#self.find_by_name(song_name) || self.create_by_name(song_name)
    if !self.find_by_name(title)  
      self.create_by_name(title)
    end
    self.find_by_name(title)
  end
  
  def self.alphabetical
    self.all.sort_by{|x| x.name}
  end
  
  def self.new_from_filename(file_name)
    file_array = file_name.split(" - ")
    file_array[1] = file_array[1].chomp(".mp3")

#I should think about more
    song = self.new
    song.artist_name = file_array[0]
    song.name = file_array[1]
    song
  end

 def self.create_from_filename(file_name)
    file_array = file_name.split(" - ")
    file_array[1] = file_array[1].chomp(".mp3")

    song = self.create
    song.artist_name = file_array[0]
    song.name = file_array[1]
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end

#song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
#song.name
#song.artist_name
