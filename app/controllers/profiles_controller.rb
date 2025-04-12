class ProfilesController < ApplicationController
    def show
      @user = User.find(params[:id])
      @is_owner = current_user == @user
    end
  end
  