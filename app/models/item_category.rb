class ItemCategory
  include ActiveModel::Model
  attr_accessor :image, :name, :info, :size, :category_name_id, :color_id, :price, :owner_id, :shop_id

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1500 }
    validates :size, length: { maximum: 200 }
    validates :category_name_id, numericality: { message: 'select' }
    validates :color_id, numericality: { message: 'select' }
    validates :price, numericality: { only_integer: true,
                                      with: /\A[0-9]+\z/,
                                      message: 'half-width number' }
    validates :owner_id
    validates :shop_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 100,
                                    less_than_or_equal_to: 9_999_999,
                                    message: 'out of setting range' }

  delegate :persisted?, to: :item

  def initialize(attributes = nil, category: Category.new, item: Item.new)
    @category = category
    @item = item
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    ActiveRecord::Base.transaction do
      @category.update(category_name_id: category_name_id)
      @item.update(image: image, name: name, info: info, size: size, color_id: color_id, price: price, owner_id: owner_id, shop_id: shop_id,
                   category_id: @category.id)
    end
  end

  def to_model
    item
  end

  private

  attr_reader :item, :category

  def default_attributes
    {
      image: item.image,
      name: item.name,
      info: item.info,
      size: item.size,
      color_id: item.color_id,
      price: item.price,
      owner_id: item.owner_id,
      shop_id: item.shop_id
    }
  end
end
