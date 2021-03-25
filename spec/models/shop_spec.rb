require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @owner = FactoryBot.create(:owner)
    @shop = FactoryBot.build(:shop)
    @shop.owner_id = @owner.id
  end

  describe 'shop新規登録' do
    context '新規登録できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@shop).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nameが空のとき登録できないこと' do
        @shop.name = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Name can't be blank"
      end

      it 'nameが重複しているとき登録できないこと' do
        @shop.save
        another_owner = FactoryBot.create(:owner)
        another_shop = FactoryBot.build(:shop)
        another_shop.name = @shop.name
        another_shop.owner_id = another_owner.id 
        another_shop.valid?
        expect(another_shop.errors.full_messages).to include "Name has already been taken"
      end

      it 'infoが空だと登録できないこと' do
        @shop.info = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Info can't be blank"
      end

      it 'infoが1501文字以上のとき登録できないこと' do
        @shop.info = 'abcdefghij' * 151
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Info is too long (maximum is 1500 characters)"
      end

      it 'owner_idが空のとき登録できないこと' do
        @shop.owner_id = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Owner can't be blank"
      end

      it 'オーナーは2つ以上のショップを登録できないこと' do
        @shop.save
        another_shop = FactoryBot.build(:shop)
        another_shop.owner_id = @shop.owner_id 
        another_shop.valid?
        expect(another_shop.errors.full_messages).to include "Owner already exists"
      end
    end
  end
end
