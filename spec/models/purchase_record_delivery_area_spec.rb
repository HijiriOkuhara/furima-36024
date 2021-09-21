require 'rails_helper'

RSpec.describe PurchaseRecordDeliveryArea, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @purchase_record_delivery_area = FactoryBot.build(:purchase_record_delivery_area, user_id: user.id, product_id: product.id)
      sleep 0.2
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_record_delivery_area).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @purchase_record_delivery_area.building_name = ''
        expect(@purchase_record_delivery_area).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @purchase_record_delivery_area.postal_code = ''
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_record_delivery_area.postal_code = '1234567'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeのハイフン前の数字が3桁でないと保存できない' do
        @purchase_record_delivery_area.postal_code = '12ー3456'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeのハイフン後の数字が4桁でないと保存できない' do
        @purchase_record_delivery_area.postal_code = '123ー456'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが全角数字を含むと保存できない' do
        @purchase_record_delivery_area.postal_code = '１23ー4567'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeがひらがなを含むと保存できない' do
        @purchase_record_delivery_area.postal_code = 'あ23ー4567'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが全角カタカナを含むと保存できない' do
        @purchase_record_delivery_area.postal_code = 'ア23ー4567'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが半角ｶﾀｶﾅを含むと保存できない' do
        @purchase_record_delivery_area.postal_code = 'ｱ23ー4567'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが漢字を含むと保存できない' do
        @purchase_record_delivery_area.postal_code = '漢23ー4567'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが-以外の記号を含むと保存できない' do
        @purchase_record_delivery_area.postal_code = '~23ー4567'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'prefectureが1を選択していると保存できない' do
        @purchase_record_delivery_area.prefecture = 1
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが全角数字を含むと保存できない' do
        @purchase_record_delivery_area.prefecture = '１'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureがひらがなを含むと保存できない' do
        @purchase_record_delivery_area.prefecture = 'あ'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが全角カタカナを含むと保存できない' do
        @purchase_record_delivery_area.prefecture = 'ア'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが半角ｶﾀｶﾅを含むと保存できない' do
        @purchase_record_delivery_area.prefecture = 'ｱ'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが漢字を含むと保存できない' do
        @purchase_record_delivery_area.prefecture = '漢'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが記号を含むと保存できない' do
        @purchase_record_delivery_area.prefecture = '~'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できない' do
        @purchase_record_delivery_area.city = ''
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空だと保存できない' do
        @purchase_record_delivery_area.block = ''
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @purchase_record_delivery_area.phone_number = ''
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字を含むと保存できない' do
        @purchase_record_delivery_area.phone_number = '１2345678901'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberがひらがなを含むと保存できない' do
        @purchase_record_delivery_area.phone_number = 'あ2345678901'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが全角カタカナを含むと保存できない' do
        @purchase_record_delivery_area.phone_number = 'ア2345678901'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが半角ｶﾀｶﾅを含むと保存できない' do
        @purchase_record_delivery_area.phone_number = 'ｱ2345678901'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが漢字を含むと保存できない' do
        @purchase_record_delivery_area.phone_number = '漢2345678901'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが記号を含むと保存できない' do
        @purchase_record_delivery_area.phone_number = '~2345678901'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが10桁未満だと保存できない' do
        @purchase_record_delivery_area.phone_number = '123456789'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが11桁超だと保存できない' do
        @purchase_record_delivery_area.phone_number = '123456789012'
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include('Phone number is too short')
      end

      it 'tokenが空では登録できないこと' do
        @purchase_record_delivery_area.token = nil
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_record_delivery_area.user_id = nil
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("User can't be blank")
      end

      it 'productが紐付いていないと保存できないこと' do
        @purchase_record_delivery_area.product_id = nil
        @purchase_record_delivery_area.valid?
        expect(@purchase_record_delivery_area.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
