class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :owner
  belongs_to :shop
  belongs_to :category, dependent: :destroy
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :color
end
