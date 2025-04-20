class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: "Gêneros atualizados!"
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:genre_names)
  end
end