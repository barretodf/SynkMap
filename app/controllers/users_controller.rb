class UsersController < ApplicationController
    before_action :set_user
  
    # BIO
    def update_bio
      @user = User.find(params[:id])
      if @user.update(bio: params[:user][:bio])
        respond_to do |format|
          format.html { redirect_to profile_path(@user), notice: 'Bio atualizada com sucesso.' }
          format.json { render json: { bio: @user.bio }, status: :ok }
        end
      else
        respond_to do |format|
          format.html { render :show, alert: 'Erro ao atualizar bio.' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
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
  