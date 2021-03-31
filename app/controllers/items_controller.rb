class ItemsController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :create] 

  def index
    @shop = Shop.find(params[:shop_id])
    @items = @shop.items.order('created_at DESC')
  end

  def new
    @item_category = ItemCategory.new
  end

  def create
    @item_category = ItemCategory.new(item_params)
    if @item_category.valid?
      @item_category.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item_category).permit(:image, :name, :info, :color_id, :price, :category_name_id ).merge( owner_id: current_owner.id, shop_id: params[:shop_id] )
  end
end
