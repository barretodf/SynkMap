class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @availabilities = current_user.availabilities
  end

  def update
    availability = current_user.availabilities.find_or_initialize_by(data: params[:data])
    availability.disponivel = params[:disponivel]
    
    if availability.save
      respond_to do |format|
        format.json { render json: { success: true, data: availability.data, disponivel: availability.disponivel } }
        format.html { redirect_to availabilities_path, notice: "Disponibilidade atualizada." }
      end
    else
      respond_to do |format|
        format.json { render json: { success: false, errors: availability.errors.full_messages }, status: :unprocessable_entity }
        format.html { redirect_to availabilities_path, alert: "Erro ao atualizar." }
      end
    end
  end
end
