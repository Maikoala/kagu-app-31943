class OwnersController < ApplicationController
  before_action :authenticate_owner!, only: [:show]
  before_action :move_to_index, only: [:show]

  def show
    @shop = current_owner.shop
  end

  def move_to_index
    @owner = Owner.find(params[:id])
    redirect_to root_path unless current_owner == @owner
  end
end
