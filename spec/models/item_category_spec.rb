require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  before do
    @owner = FactoryBot.create(:owner)
    @shop = FactoryBot.create(:shop)
    @item_category = FactoryBot.build(:item_category, owner_id: @owner.id, shop_id: @shop.id)
    @item_category.image = fixture_file_upload('files/test_image.jpeg')
  end

  describe '商品出品情報の保存' do
    context '出品情報の保存ができる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@item_category).to be_valid
      end
    end

    context '出品情報の保存ができない場合' do
      it '商品画像がないと保存できないこと' do
        @item_category.image = nil
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include "Image can't be blank"
      end

      it 'nameが空だと保存できないこと' do
        @item_category.name = nil
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include "Name can't be blank"
      end

      it 'nameが41文字以上だと保存できないこと' do
        @item_category.name = 'あいうえおabcdef' * 4
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end

      it 'infoが空だと保存できないこと' do
        @item_category.info = nil
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include "Info can't be blank"
      end

      it 'infoが1501文字以上だと保存できないこと' do
        @item_category.info = 'アイウエオかきくけこabcde漢' * 100
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Info is too long (maximum is 1500 characters)'
      end

      it 'sizeが空だと保存できないこと' do
        @item_category.size = nil
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include "Size can't be blank"
      end

      it 'sizeが201文字以上だと保存できないこと' do
        @item_category.size = '12345abcdeアイウエオあいうえお阿' * 10
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Size is too long (maximum is 200 characters)'
      end

      it 'category_name_idを選択していないと保存できないこと' do
        @item_category.category_name_id = nil
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Category name select'
      end

      it 'color_idを選択していないと保存できないこと' do
        @item_category.color_id = nil
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Color select'
      end

      it 'priceが空だと保存できないこと' do
        @item_category.price = nil
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが100円未満だと保存できないこと' do
        @item_category.price = 99
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Price out of setting range'
      end

      it 'priceが10,000,000円以上だと保存できないこと' do
        @item_category.price = 10_000_000
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Price out of setting range'
      end

      it 'priceが全角だと保存できないこと' do
        @item_category.price = '５０００'
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Price half-width number'
      end

      it 'priceが数字以外だと保存できないこと' do
        @item_category.price = 'abc'
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Price half-width number'
      end

      it 'priceが半角英数混合だと保存できないこと' do
        @item_category.price = '333qqq'
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Price half-width number'
      end

      it 'priceが整数以外だと保存できないこと' do
        @item_category.price = 4000.11
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include 'Price half-width number'
      end

      it 'owner_idが空だと保存できないこと' do
        @item_category.owner_id = nil
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include "Owner can't be blank"
      end

      it 'shop_idが空だと保存できないこと' do
        @item_category.shop_id = nil
        @item_category.valid?
        expect(@item_category.errors.full_messages).to include "Shop can't be blank"
      end
    end
  end
end
