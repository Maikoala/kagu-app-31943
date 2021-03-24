require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、postal_code、birthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上で必ず半角英数字混合であれば登録できること' do
        @user.password = 'abcd12'
        @user.password_confirmation = 'abcd12'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空のとき登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空のとき登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在しているとき登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'emailに@がないとき登録できないこと' do
        @user.email = 'abcdefghijkl'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordが空のとき登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが5文字以下のとき登録できないこと' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'passwordが全角のとき登録できないこと' do
        @user.password = '１２３ａｂｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end

      it 'passwordが英字のみのとき登録できないこと' do
        @user.password = 'qqqppp'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end

      it 'passwordが数字のみのとき登録できないこと' do
        @user.password = '888777'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end

      it 'passwordが存在してもpassword_confirmationが空のとき登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordとpassword_confirmationが同一でないとき登録できないこと' do
        @user.password = 'sss888'
        @user.password_confirmation = 'ttt777'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'first_nameが空のとき登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'first_nameが半角のとき登録できないこと' do
        @user.first_name = 'ﾅｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name Full-width characters'
      end

      it 'first_nameが英字のとき登録できないこと' do
        @user.first_name = 'ｎａｏ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name Full-width characters'
      end

      it 'last_nameが空のとき登録できないこと' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'last_nameが半角のとき登録できないこと' do
        @user.last_name = 'ﾀｶﾊｼ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name Full-width characters'
      end

      it 'last_nameが英字のとき登録できないこと' do
        @user.last_name = 'ｔａｋａｈａｓｉ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name Full-width characters'
      end

      it 'first_name_kanaが空のとき登録できないこと' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'first_name_kanaが半角のとき登録できないこと' do
        @user.first_name_kana = 'ﾀｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana Full-width katakana characters'
      end

      it 'first_name_kanaがカタカナ以外のとき登録できないこと' do
        @user.first_name_kana = 'たか'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana Full-width katakana characters'
      end

      it 'last_name_kanaが空のとき登録できないこと' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'last_name_kanaが半角のとき登録できないこと' do
        @user.last_name_kana = 'ｺﾞﾄｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana Full-width katakana characters'
      end

      it 'last_name_kanaがカタカナ以外のとき登録できないこと' do
        @user.last_name_kana = '後藤'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana Full-width katakana characters'
      end

      it 'postal_codeが空のとき登録できないこと' do
        @user.postal_code = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeにハイフンがないとき登録できないこと' do
        @user.postal_code = '6662222'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Postal code Input correctly'
      end

      it 'postal_codeが全角のとき登録できないこと' do
        @user.postal_code = '６６６ー２２２２'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Postal code Input correctly'
      end

      it 'postal_codeが数字以外のとき登録できないこと' do
        @user.postal_code = 'hhh-kkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Postal code Input correctly'
      end

      it 'birthdayが空だと登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
