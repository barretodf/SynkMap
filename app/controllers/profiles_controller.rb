class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:banner].present?
      image = params[:user][:banner]
      dimensions = FastImage.size(image.tempfile)
      if dimensions && (dimensions[0] < 800 || dimensions[1] < 200)
        flash[:alert] = "Imagem muito pequena! Tamanho mínimo: 800x200px."
        redirect_to profile_path(@user) and return
      end
    end
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: "Atualizado com sucesso!"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :location, :available, :genre_names, :banner)
  end
end