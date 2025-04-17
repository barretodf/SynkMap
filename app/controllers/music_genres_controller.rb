class MusicGenresController < ApplicationController
  before_action :authenticate_user!

  def index
    @genres = MusicGenre.all
  end

  def add_to_user
    genre = MusicGenre.find_by(id: params[:id])
    if genre
      current_user.music_genres << genre unless current_user.music_genres.include?(genre)
      render_updated_list
    else
      render json: { success: false, error: "Gênero não encontrado." }, status: :not_found
    end
  end

  def remove_from_user
    genre = MusicGenre.find_by(id: params[:id])
    if genre
      current_user.music_genres.delete(genre)
      render_updated_list
    else
      render json: { success: false, error: "Gênero não encontrado." }, status: :not_found
    end
  end

  private

  def render_updated_list
    render json: {
      success: true,
      html: render_to_string(partial: "users/genres", locals: { user: current_user }, formats: [:html])
    }
  end
end