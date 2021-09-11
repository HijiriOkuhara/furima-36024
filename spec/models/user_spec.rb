require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '入力が必要なカラムへ正しい値が入力できれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it '@が含まれないemailでは登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '5moji'
        @user.password_confirmation = '5moji'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it '平仮名が含まれるpasswordでは登録できない' do
        @user.password = 'ひらがなtest1'
        @user.password_confirmation = 'ひらがなtest1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '全角カタカナが含まれるpasswordでは登録できない' do
        @user.password = 'カタカナtest1'
        @user.password_confirmation = 'カタカナtest1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '漢字が含まれるpasswordでは登録できない' do
        @user.password = '漢字test1'
        @user.password_confirmation = '漢字test1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '記号が含まれるpasswordでは登録できない' do
        @user.password = '~test1'
        @user.password_confirmation = '~test1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '全角英字が含まれるpasswordでは登録できない' do
        @user.password = 'ａtest1'
        @user.password_confirmation = 'ａtest1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '全角数字が含まれるpasswordでは登録できない' do
        @user.password = '１test1'
        @user.password_confirmation = '１test1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '半角英字のみのpasswordでは登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '半角数字のみのpasswordでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '半角カタカナが含まれるpasswordでは登録できない' do
        @user.password = 'ｶﾀｶﾅtest1'
        @user.password_confirmation = 'ｶﾀｶﾅtest1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = '1234password'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'ー以外の記号が含まれるlast_nameでは登録できない' do
        @user.last_name = '~苗字'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it '全角英字が含まれるlast_nameでは登録できない' do
        @user.last_name = 'ａ苗字'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it '全角数字が含まれるlast_nameでは登録できない' do
        @user.last_name = '１苗字'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it '半角英字が含まれるlast_nameでは登録できない' do
        @user.last_name = 'a苗字'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it '半角数字が含まれるlast_nameでは登録できない' do
        @user.last_name = '1苗字'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it '半角カタカナが含まれるlast_nameでは登録できない' do
        @user.last_name = 'ﾐｮｳ字'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'ー以外の記号が含まれるfirst_nameでは登録できない' do
        @user.first_name = '~名前'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it '全角英字が含まれるfirst_nameでは登録できない' do
        @user.first_name = 'ａ名前'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it '全角数字が含まれるfirst_nameでは登録できない' do
        @user.first_name = '１名前'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it '半角英字が含まれるfirst_nameでは登録できない' do
        @user.first_name = 'a名前'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it '半角数字が含まれるfirst_nameでは登録できない' do
        @user.first_name = '1名前'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it '半角カタカナが含まれるfirst_nameでは登録できない' do
        @user.first_name = 'ﾅ前'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'last_name_furiganaが空では登録できない' do
        @user.last_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name furigana can't be blank"
      end
      it '平仮名が含まれるlast_name_furiganaでは登録できない' do
        @user.last_name_furigana = 'みョウジ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name furigana is invalid'
      end
      it '漢字が含まれるlast_name_furiganaでは登録できない' do
        @user.last_name_furigana = '苗ジ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name furigana is invalid'
      end
      it 'ー以外の記号が含まれるlast_name_furiganaでは登録できない' do
        @user.last_name_furigana = '~ミョウジ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name furigana is invalid'
      end
      it '全角英字が含まれるlast_name_furiganaでは登録できない' do
        @user.last_name_furigana = 'ａミョウジ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name furigana is invalid'
      end
      it '全角数字が含まれるlast_name_furiganaでは登録できない' do
        @user.last_name_furigana = '１ミョウジ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name furigana is invalid'
      end
      it '半角英字が含まれるlast_name_furiganaでは登録できない' do
        @user.last_name_furigana = 'aミョウジ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name furigana is invalid'
      end
      it '半角数字が含まれるlast_name_furiganaでは登録できない' do
        @user.last_name_furigana = '1ミョウジ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name furigana is invalid'
      end
      it '半角カタカナが含まれるlast_name_furiganaでは登録できない' do
        @user.last_name_furigana = 'ﾐｮｳジ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name furigana is invalid'
      end

      it 'first_name_furiganaが空では登録できない' do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name furigana can't be blank"
      end
      it '平仮名が含まれるfirst_name_furiganaでは登録できない' do
        @user.first_name_furigana = 'なマエ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name furigana is invalid'
      end
      it '漢字が含まれるfirst_name_furiganaでは登録できない' do
        @user.first_name_furigana = '名マエ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name furigana is invalid'
      end
      it 'ー以外の記号が含まれるfirst_name_furiganaでは登録できない' do
        @user.first_name_furigana = '〜ナマエ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name furigana is invalid'
      end
      it '全角英字が含まれるfirst_name_furiganaでは登録できない' do
        @user.first_name_furigana = 'ｎａマエ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name furigana is invalid'
      end
      it '全角数字が含まれるfirst_name_furiganaでは登録できない' do
        @user.first_name_furigana = '１ナマエ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name furigana is invalid'
      end
      it '半角英字が含まれるfirst_name_furiganaでは登録できない' do
        @user.first_name_furigana = 'naマエ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name furigana is invalid'
      end
      it '半角数字が含まれるfirst_name_furiganaでは登録できない' do
        @user.first_name_furigana = '1ナマエ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name furigana is invalid'
      end
      it '半角カタカナが含まれるfirst_name_furiganaでは登録できない' do
        @user.first_name_furigana = 'ﾅマエ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name furigana is invalid'
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
