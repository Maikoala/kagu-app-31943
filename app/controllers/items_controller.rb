class ItemsController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :create, :edit, :create]
  before_action :set_shop, only: [:new, :create]
  before_action :set_shop_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:new, :create, :edit, :update]

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

  def show
  end

  def edit
    @item_category = ItemCategory.new(item: @item)
  end

  def update
    @item_category = ItemCategory.new(item_params, item: @item)
    if @item_category.valid?
      @item_category.save
      redirect_to action: :show
    else
      render :edit
    end
  end

  def delete
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :color_id, :price, :category_name_id).merge(
      owner_id: current_owner.id, shop_id: params[:shop_id]
    )
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_shop_item
    @shop = Shop.find(params[:shop_id])
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_owner == @shop.owner
  end
end
