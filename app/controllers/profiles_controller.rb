class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
  end

  def update
    @user = User.find(params[:id])
    Rails.logger.info "Received prices params: #{params[:prices].inspect}"

    if params[:prices].present?
      @user.prices.destroy_all # Remove preços antigos
      params[:prices].each do |key, value|
        next unless key.match?(/\d+_description/)
        index = key.split("_").first
        description = value&.strip
        amount_str = params[:prices]["#{index}_amount"]&.strip
        next if description.blank? || amount_str.blank?

        amount = amount_str.gsub(/[^0-9.]/, "").to_f
        Rails.logger.info "Creating price: description=#{description}, amount=#{amount}"
        @user.prices.build(description: description, amount: amount) if amount > 0
      end
    else
      Rails.logger.info "No prices params received, clearing all prices"
      @user.prices.destroy_all
    end

    Rails.logger.info "User prices before save: #{@user.prices.inspect}"
    if @user.save
      Rails.logger.info "User prices after save: #{@user.prices.inspect}"
      respond_to do |format|
        format.html { redirect_to profile_path(@user), notice: "Preços atualizados com sucesso!" }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("prices_content", partial: "profiles/prices", locals: { user: @user })
        end
      end
    else
      Rails.logger.info "Errors: #{@user.errors.full_messages}"
      respond_to do |format|
        format.html { redirect_to profile_path(@user), alert: "Erro ao atualizar preços: #{@user.errors.full_messages.join(", ")}" }
        format.turbo_stream { redirect_to profile_path(@user), alert: "Erro ao atualizar preços: #{@user.errors.full_messages.join(", ")}" }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :location, :available, :banner, :profile_picture, :bio, :genre_names)
  end
end