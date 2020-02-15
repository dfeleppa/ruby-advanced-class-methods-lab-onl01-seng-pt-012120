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

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new 
    title = filename.gsub(/\w+[^-]\z/, "")
    song.artist_name = title.scan(/\w+[^-]/)[0].strip
    song.name = title.scan(/\w+[^-]+\w+[^.]/)[1]
    song 
  end
end