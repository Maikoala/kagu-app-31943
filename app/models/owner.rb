class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :account_name
    validates :first_name, :last_name,
              format: { with: /\A[ぁ-んァ-ン一-龥々]/,
                        message: 'Full-width characters' }
    validates :first_name_kana, :last_name_kana,
              format: { with: /\A([ァ-ン]|ー)+\z/,
                        message: 'Full-width katakana characters' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :state_province_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address_line_1
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'Input only number' }
    validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: 'Include both letters and numbers' }

  has_one :shop
  has_many :items

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state_province
end
