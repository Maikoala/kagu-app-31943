class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :owner
  belongs_to :shop
  belongs_to :category
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_name
  belongs_to :color
end
