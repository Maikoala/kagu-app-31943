class ShopsController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :create]

  def index
    @shops = Shop.order(:name)
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :info).merge(owner_id: current_owner.id)
  end
end
