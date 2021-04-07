class ShopsController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :create]
  before_action :set_search, only: [:index]

  def index
    @shops = Shop.order(:name)
    set_item_column
    set_category_column
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

  private

  def shop_params
    params.require(:shop).permit(:name, :info).merge(owner_id: current_owner.id)
  end
end
