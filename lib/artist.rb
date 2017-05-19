require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all_artists = []
  @@song_count = 0

  def initialize(name)
    @name = name
    @songs = []
    @@all_artists << self
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_song_by_name(name)
    song = Song.new(name)
    song.artist = self
    @songs << song
  end

  def self.all
    @@all_artists
  end

  def self.song_count
    self.all.each do |artist|
      unless artist.songs[0] == nil
        @@song_count += 1
      end
    end
    @@song_count
  end

end
