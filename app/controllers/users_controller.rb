class UsersController < ApplicationController
    before_action :set_user
  
    # BIO
    def update_bio
      if @user.update(biografia: params[:biografia])
        respond_to do |format|
          format.html { redirect_to @user, notice: "Biografia atualizada com sucesso!" }
          format.json { render json: { success: true, biografia: @user.biografia } }
        end
      else
        respond_to do |format|
          format.html { redirect_to @user, alert: "Erro ao atualizar biografia." }
          format.json { render json: { success: false, errors: @user.errors.full_messages }, status: :unprocessable_entity }
        end
      end
    end
  
    # Placeholder para os próximos
    def update_genres
      # lógica para adicionar/remover gêneros
    end
  
    def update_services
      # lógica para atualizar tipos de serviço
    end
  
    def update_availability
      # lógica para marcar dias disponíveis
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  end
  