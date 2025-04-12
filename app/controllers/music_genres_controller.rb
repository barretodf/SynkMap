class MusicGenresController < ApplicationController
  def index
    @music_genres = MusicGenre.all
  end
end
