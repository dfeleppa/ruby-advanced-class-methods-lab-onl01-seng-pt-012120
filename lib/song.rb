class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  
  def self.all
    @@all
  end
  

  def self.create
      song = self.new
      song.all << song
      song
  end
  
  def save
    self.class.all << self
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name 
    @@all << self
    song
    
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by! {|song| song.name == name}
  end

  def self.new_from_filename
    
  end
  
  def self.create_from_filename
    
  end
  
  def self.destroy_all
    self.all.clear
  end

end