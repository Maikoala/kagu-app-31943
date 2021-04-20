class ApplicationController < ActionController::Base
  before_action :basic_auth

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

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
