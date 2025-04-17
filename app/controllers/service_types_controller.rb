class ServiceTypesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_service_type, only: [:update, :destroy]
  
    def create
      @service = current_user.service_types.create(service_type_params)
      render_updated_list
    end
  
    def update
      @service.update(service_type_params)
      render_updated_list
    end
  
    def destroy
      @service.destroy
      render_updated_list
    end
  
    private
  
    def set_service_type
      @service = current_user.service_types.find(params[:id])
    end
  
    def service_type_params
      params.require(:service_type).permit(:nome, :preco)
    end
  
    def render_updated_list
      render json: {
        success: true,
        html: render_to_string(partial: "users/services", locals: { user: current_user }, formats: [:html])
      }
    end
  end
  