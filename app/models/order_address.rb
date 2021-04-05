class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :first_name, :last_name, :postal_code, :state_province_id, :city, :address_line_1,
                :address_line_2, :phone_number

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :first_name, :last_name,
              format: { with: /\A[ぁ-んァ-ン一-龥々]/,
                        message: 'full-width japanese characters' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'input correctly' }
    validates :state_province_id, numericality: { other_than: 1, message: 'select' }
    validates :city
    validates :address_line_1
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(first_name: first_name, last_name: last_name, postal_code: postal_code, state_province_id: state_province_id,
                   city: city, address_line_1: address_line_1, address_line_2: address_line_2, phone_number: phone_number, order_id: order.id)
  end
end
