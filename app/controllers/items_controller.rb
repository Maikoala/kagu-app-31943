class ItemsController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_shop, only: [:index, :new, :create]
  before_action :set_shop_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_search, only: [:index, :search, :show]
  before_action :set_item_column, only: [:index, :show, :search]
  before_action :set_category_column, only: [:index, :show, :search]
  before_action :move_to_index_edit, only: [:edit, :update, :destroy]

  def index
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

  def destroy
    redirect_to action: :index if @item.destroy
  end

  def search
    @results = @q.result.includes(:category)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :size, :color_id, :price, :category_name_id).merge(
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

  def move_to_index_edit
    redirect_to root_path if @item.order.present?
  end
end
