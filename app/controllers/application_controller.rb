class ApplicationController < ActionController::Base
  def set_search
    @q = Item.ransack(params[:q])
  end

  def set_item_column
    @item_name = Item.select('name').distinct
    @item_shop = Shop.order(:name)
    @item_color = Color.all
  end

  def set_category_column
    @category_name = CategoryName.all
  end
end
