require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    self.all << self.new
    self.all.last
  end

  def self.new_by_name(name)
    new_song =  self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    self.all << self.new_by_name(name)
    self.all.last
  end

  def self.find_by_name(name)
    self.all.find{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      self.create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    self.all.sort_by{|x| x.name}
  end

  def self.new_from_filename(filename)
    artist_song  = filename.split(/- /)
    song_name = artist_song[1].split(".mp3").first
    song = self.create_by_name(song_name)
    song.artist_name = artist_song[0].strip
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
    self.all.last
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
