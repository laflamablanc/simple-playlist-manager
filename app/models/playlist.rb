class Playlist < ActiveRecord::Base
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  has_many :user_playlists
  has_many :users, through: :user_playlists

  def average_rating
    userplaylist = UserPlaylist.all.filter{|up| up.playlist == self && up.rating != nil}
    avg = userplaylist.sum{|up| up.rating}/userplaylist.count
    avg
  end


end