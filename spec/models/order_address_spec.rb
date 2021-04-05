require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @owner = FactoryBot.create(:owner)
    @shop = FactoryBot.create(:shop)
    @category = FactoryBot.create(:category)
    @item = FactoryBot.create(:item, owner_id: @owner.id, shop_id: @shop.id, category_id: @category.id)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '購入情報の保存ができる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it 'address_line_2が空でも保存できること' do
        @order_address.address_line_2 = nil
        expect(@order_address).to be_valid
      end
    end

    context ' 購入情報の保存ができない場合' do
      it 'tokenが空のとき保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      
      it 'user_idが空のとき保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end

      it 'item_idが空のとき保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end

      it 'first_nameが空のとき保存できないこと' do
        @order_address.first_name = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "First name can't be blank"
      end

      it 'first_nameが半角のとき保存できないこと' do
        @order_address.first_name = 'ｶﾅ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "First name full-width japanese characters"
      end

      it 'first_nameが英字のとき保存できないこと' do
        @order_address.first_name = 'ｋａｎａ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "First name full-width japanese characters"
      end

      it 'last_nameが空のとき保存できないこと' do
        @order_address.last_name = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Last name can't be blank"
      end

      it 'last_nameが半角のとき保存できないこと' do
        @order_address.last_name = 'ｽｽﾞｷ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Last name full-width japanese characters"
      end

      it 'last_nameが英字のとき保存できないこと' do
        @order_address.last_name = 'ｓｕｚｕｋｉ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Last name full-width japanese characters"
      end

      it 'postal_codeが空のとき保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeにハイフンがないとき保存できないこと' do
        @order_address.postal_code = '3334444'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code input correctly"
      end

      it 'postal_codeが全角のとき保存できないこと' do
        @order_address.postal_code = '４４４−５５５５'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code input correctly"
      end

      it 'postal_codeが数字以外のとき保存できないこと' do
        @order_address.postal_code = 'aaa-bbbb'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code input correctly"
      end

      it 'state_province_idが空のとき保存できないこと' do
        @order_address.state_province_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "State province can't be blank"
      end

      it 'state_province_idを選択していないとき保存できないこと' do
        @order_address.state_province_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "State province select"
      end

      it 'cityが空のとき保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it 'address_line_1が空のとき保存できないこと' do
        @order_address.address_line_1 = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address line 1 can't be blank"
      end

      it 'phone_numberが空のとき保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberが全角のとき保存できないこと' do
        @order_address.phone_number = '０８０１１１１２２２２'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number input only number"
      end

      it 'phone_numberにハイフンがあるとき保存できないこと' do
        @order_address.phone_number = '080-2222-3333'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number input only number"
      end

      it 'phone_numberが数字以外のとき保存できないこと' do
        @order_address.phone_number = 'eeeffffgggg'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number input only number"
      end

      it 'phone_numberが9桁以下のとき保存できないこと' do
        @order_address.phone_number = '090222333'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number input only number"
      end

      it 'phone_numberが12桁以上のとき保存できないこと' do
        @order_address.phone_number = '080444445555'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number input only number"
      end

    end
  end
end
