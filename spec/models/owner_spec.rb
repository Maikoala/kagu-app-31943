require 'rails_helper'

RSpec.describe Owner, type: :model do
  before do
    @owner = FactoryBot.build(:owner)
  end

  describe 'オーナー新規登録' do
    context '新規登録できる場合' do
      it 'account_name,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,postal_code,state_province_id,city,address_line_1,address_line_2,phone_number,birthdayが存在すれば登録できること' do
        expect(@owner).to be_valid
      end

      it 'passwordが6文字以上で必ず半角英数字混合であれば登録できること' do
        @owner.password = 'abc123'
        @owner.password_confirmation = 'abc123'
        expect(@owner).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'account_nameが空だと登録できないこと' do
        @owner.account_name = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Account name can't be blank"
      end

      it 'emailが空だと登録できないこと' do
        @owner.email = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailに@がないと登録できないこと' do
        @owner.email = 'abcdefghijk'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Email is invalid"
      end

      it '重複するemailでは登録できないこと' do
        @owner.save
        another_owner = FactoryBot.build(:owner, email: @owner.email)
        another_owner.valid?
        expect(another_owner.errors.full_messages).to include "Email has already been taken"
      end

      it 'passwordが空だと登録できないこと' do
        @owner.password = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが５文字以下のとき登録できないこと' do
        @owner.password = 'ab12'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'passwordが全角のとき登録できないこと' do
        @owner.password = 'ａｂｃ１２３'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Password Include both letters and numbers"
      end

      it 'passwordが英字のみのとき登録できないこと' do
        @owner.password = 'abcdefg'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Password Include both letters and numbers"
      end

      it 'passwordが数字のみのとき登録できないこと' do
        @owner.password = '1234567'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Password Include both letters and numbers"
      end

      it 'passwordが存在してもpassword_confirmationが空だと登録できないこと' do
        @owner.password_confirmation = ""
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordとpassword_confirmationが同一でないとき登録できないこと' do
        @owner.password = 'abc123'
        @owner.password_confirmation = 'def456'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'first_nameが空だと登録できないこと' do
        @owner.first_name = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "First name can't be blank"
      end

      it 'first_nameが半角のとき登録できないこと' do
        @owner.first_name = 'ﾏｺﾄ'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "First name Full-width characters"
      end

      it 'first_nameが英字のとき登録できないこと' do
        @owner.first_name = 'ｍａｋｏｔｏ'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "First name Full-width characters"
      end

      it 'last_nameが空だと登録できないこと' do
        @owner.last_name = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Last name can't be blank"
      end

      it 'last_nameが半角のとき登録できないこと' do
        @owner.last_name = 'ｽｽﾞｷ'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Last name Full-width characters"
      end

      it 'last_nameが英字のとき登録できないこと' do
        @owner.last_name = 'ｓｕｚｕｋｉ'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Last name Full-width characters"
      end

      it 'first_name_kanaが空だと登録できないこと' do
        @owner.first_name_kana = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'first_name_kanaが半角のとき登録できないこと' do
        @owner.first_name_kana = 'ﾋﾛｷ'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "First name kana Full-width katakana characters"
      end

      it 'first_name_kanaがカタカナでないとき登録できないこと' do
        @owner.first_name_kana = 'ひろき'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "First name kana Full-width katakana characters"
      end

      it 'last_name_kanaが空だと登録できないこと' do
        @owner.last_name_kana = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'last_name_kanaが半角のとき登録できないこと' do
        @owner.last_name_kana = 'ｻﾄｳ'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Last name kana Full-width katakana characters"
      end

      it 'last_name_kanaがカタカナでないとき登録できないこと' do
        @owner.last_name_kana = '佐藤'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Last name kana Full-width katakana characters"
      end

      it 'postal_codeが空だと登録できないこと' do
        @owner.postal_code = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeにハイフンがないとき登録できないこと' do
        @owner.postal_code = '1234567'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Postal code Input correctly"
      end

      it 'postal_codeが全角のとき登録できないこと' do
        @owner.postal_code = '１１１２２２２'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Postal code Input correctly"
      end

      it 'postal_codeが数字以外のとき登録できないこと' do
        @owner.postal_code = 'jjj-kkkk'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Postal code Input correctly"
      end

      it 'state_province_idが空だと登録できないこと' do
        @owner.state_province_id = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "State province can't be blank"
      end

      it 'state_province_idを選択していないとき登録できないこと' do
        @owner.state_province_id = 1
        @owner.valid?
        expect(@owner.errors.full_messages).to include "State province Select"
      end

      it 'cityが空だと登録できないこと' do
        @owner.city = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "City can't be blank"
      end

      it 'address_line_1が空だと登録できないこと' do
        @owner.address_line_1 = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Address line 1 can't be blank"
      end

      it 'phone_numberが空だと登録できないこと' do
        @owner.phone_number = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberが全角のとき登録できないこと' do
        @owner.phone_number = '０８０６７８９４３２１'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Phone number Input only number"
      end

      it 'phone_numberが数字以外のとき登録できないこと' do
        @owner.phone_number = 'cccccxxxxxx'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Phone number Input only number"
      end

      it 'phone_numberにハイフンがあるとき登録できないこと' do
        @owner.phone_number = '090-7777-6666'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Phone number Input only number"
      end

      it 'phone_numberが9桁以下のとき登録できないこと' do
        @owner.phone_number = '034567890'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Phone number Input only number"
      end

      it 'phone_numberが12桁以上のとき登録できないこと' do
        @owner.phone_number = '080111112222'
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Phone number Input only number"
      end

      it 'birthdayが空だと登録できないこと' do
        @owner.birthday = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
