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
    song=self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    @name=name
    song=self.new
    song.name=name
    song
  end
  
  def self.create_by_name(name)
    @name=name
    song=self.new
    song.name=name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? song = self.find_by_name(name) : song=self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    names=filename.split(" - ")
    artist_name=names[0]
    name=names[1]
    name.chomp!(".mp3")
    song=self.new_by_name(name)
    @artist=artist_name
    song.artist_name=artist_name
    song
  end
  
  def self.create_from_filename(filename)
    names=filename.split(" - ")
    artist_name=names[0]
    name=names[1]
    name.chomp!(".mp3")
    song=self.create_by_name(name)
    @artist=artist_name
    song.artist_name=artist_name
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
