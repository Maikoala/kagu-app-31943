class ItemCategory
  include ActiveModel::Model
  attr_accessor :image, :name, :info, :category_name_id, :color_id, :price, :owner_id, :shop_id
  
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1500 }
    validates :category_name_id, numericality: { other_than: 1, message: 'select' }
    validates :color_id, numericality: { other_than: 1, message: 'select' }
    validates :price, numericality: { only_integer: true,
                                      with: /\A[0-9]+\z/,
                                      message: 'half-width number'}
    validates :owner_id
    validates :shop_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 100,
                                    less_than_or_equal_to: 9_999_999,
                                    message: 'out of setting range' }
  def save
    category = Category.create(category_name_id: category_name_id )
    Item.create(image: image, name: name, info: info, color_id: color_id, price: price, owner_id: owner_id, shop_id: shop_id, category_id: category.id)
  end
end