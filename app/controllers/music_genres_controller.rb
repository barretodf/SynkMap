class MusicGenresController < ApplicationController
  before_action :authenticate_user!

  def index
    @music_genres = MusicGenre.all
  end

  def add_to_user
    genre = MusicGenre.find(params[:id])
    current_user.music_genres << genre unless current_user.music_genres.include?(genre)

    respond_to do |format|
      format.json { render json: { success: true, genres: current_user.music_genres.pluck(:nome) } }
    end
  end

  def remove_from_user
    genre = MusicGenre.find(params[:id])
    current_user.music_genres.delete(genre)

    respond_to do |format|
      format.json { render json: { success: true, genres: current_user.music_genres.pluck(:nome) } }
    end
  end
end
