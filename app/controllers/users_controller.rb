class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :move_to_index, only: [:show]

  def show
  end

  def move_to_index
    @user = User.find(params[:id])
    redirect_to root_path unless current_user == @user
  end
end