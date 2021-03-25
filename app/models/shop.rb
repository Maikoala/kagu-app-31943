class Shop < ApplicationRecord
  with_options presence: true do
    validates :name, uniqueness: { case_sensitive: false, message: 'has already been taken' }
    validates :info, length: { maximum: 1500, message: 'is too long (maximum is 1500 characters)' }
    validates :owner_id, uniqueness: { case_sensitive: false, message: 'already exists' }
  end

  belongs_to :owner
  has_many :items
end
