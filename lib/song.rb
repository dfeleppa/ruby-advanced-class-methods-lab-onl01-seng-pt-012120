class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

   def self.create
    song = self.new
    song.class.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name  
    song  
  end 

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song 
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) 
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split_name = name.split(" - ")
    song = self.new(split_name[1])
    song.artist_name = split_name[0]
    song
  end
  end
end