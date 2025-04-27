class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:prices].present?
      @user.prices.destroy_all
      params[:user][:prices].each do |key, value|
        next unless key.end_with?("_amount")
        index = key.split("_").first
        description = params[:user][:prices]["#{index}_description"]
        amount = value.gsub(/[^0-9.]/, "").to_f
        @user.prices.build(description: description, amount: amount) if amount > 0 && description.present?
      end
    end

    if @user.save
      redirect_to profile_path(@user), notice: "Preços atualizados com sucesso!"
    else
      redirect_to profile_path(@user), alert: "Erro ao atualizar preços!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :location, :available, :banner, :profile_picture, :bio, :genre_names, prices: {})
  end
end