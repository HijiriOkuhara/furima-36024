require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it '入力が必要なカラムへ正しい値が入力できれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'nameが空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end
      it 'nameが41文字以上では出品できない' do
        @product.name = 'あ' * 41
        @product.valid?
        expect(@product.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end

      it 'descriptionが空では出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Description can't be blank"
      end
      it 'descriptionが1001文字以上では出品できない' do
        @product.description = 'あ' * 1001
        @product.valid?
        expect(@product.errors.full_messages).to include 'Description is too long (maximum is 1000 characters)'
      end

      it 'category_idが空では出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idが1では出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category must be other than 1'
      end
      it 'category_idが半角英字では出品できない' do
        @product.category_id = 'a'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category is not a number'
      end
      it 'category_idが全角英字では出品できない' do
        @product.category_id = 'ａ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category is not a number'
      end
      it 'category_idがひらがなでは出品できない' do
        @product.category_id = 'あ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category is not a number'
      end
      it 'category_idが半角ｶﾀｶﾅでは出品できない' do
        @product.category_id = 'ｱ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category is not a number'
      end
      it 'category_idが全角カタカナでは出品できない' do
        @product.category_id = 'ア'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category is not a number'
      end
      it 'category_idが漢字では出品できない' do
        @product.category_id = '漢'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category is not a number'
      end
      it 'category_idが記号では出品できない' do
        @product.category_id = '~'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category is not a number'
      end

      it 'state_idが空では出品できない' do
        @product.state_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "State can't be blank"
      end
      it 'state_idが1では出品できない' do
        @product.state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'State must be other than 1'
      end
      it 'state_idが半角英字では出品できない' do
        @product.state_id = 'a'
        @product.valid?
        expect(@product.errors.full_messages).to include 'State is not a number'
      end
      it 'state_idが全角英字では出品できない' do
        @product.state_id = 'ａ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'State is not a number'
      end
      it 'state_idがひらがなでは出品できない' do
        @product.state_id = 'あ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'State is not a number'
      end
      it 'state_idが半角ｶﾀｶﾅでは出品できない' do
        @product.state_id = 'ｱ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'State is not a number'
      end
      it 'state_idが全角カタカナでは出品できない' do
        @product.state_id = 'ア'
        @product.valid?
        expect(@product.errors.full_messages).to include 'State is not a number'
      end
      it 'state_idが漢字では出品できない' do
        @product.state_id = '漢'
        @product.valid?
        expect(@product.errors.full_messages).to include 'State is not a number'
      end
      it 'state_idが記号では出品できない' do
        @product.state_id = '~'
        @product.valid?
        expect(@product.errors.full_messages).to include 'State is not a number'
      end

      it 'delivery_charge_burden_idが空では出品できない' do
        @product.delivery_charge_burden_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Delivery charge burden can't be blank"
      end
      it 'delivery_charge_burden_idが1では出品できない' do
        @product.delivery_charge_burden_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery charge burden must be other than 1'
      end
      it 'delivery_charge_burden_idが半角英字では出品できない' do
        @product.delivery_charge_burden_id = 'a'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery charge burden is not a number'
      end
      it 'delivery_charge_burden_idが全角英字では出品できない' do
        @product.delivery_charge_burden_id = 'ａ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery charge burden is not a number'
      end
      it 'delivery_charge_burden_idがひらがなでは出品できない' do
        @product.delivery_charge_burden_id = 'あ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery charge burden is not a number'
      end
      it 'delivery_charge_burden_idが半角ｶﾀｶﾅでは出品できない' do
        @product.delivery_charge_burden_id = 'ｱ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery charge burden is not a number'
      end
      it 'delivery_charge_burden_idが全角カタカナでは出品できない' do
        @product.delivery_charge_burden_id = 'ア'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery charge burden is not a number'
      end
      it 'delivery_charge_burden_idが漢字では出品できない' do
        @product.delivery_charge_burden_id = '漢'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery charge burden is not a number'
      end
      it 'delivery_charge_burden_idが記号では出品できない' do
        @product.delivery_charge_burden_id = '~'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery charge burden is not a number'
      end

      it 'prefecture_idが空では出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが1では出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'prefecture_idが半角英字では出品できない' do
        @product.prefecture_id = 'a'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefecture is not a number'
      end
      it 'prefecture_idが全角英字では出品できない' do
        @product.prefecture_id = 'ａ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefecture is not a number'
      end
      it 'prefecture_idがひらがなでは出品できない' do
        @product.prefecture_id = 'あ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefecture is not a number'
      end
      it 'prefecture_idが半角ｶﾀｶﾅでは出品できない' do
        @product.prefecture_id = 'ｱ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefecture is not a number'
      end
      it 'prefecture_idが全角カタカナでは出品できない' do
        @product.prefecture_id = 'ア'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefecture is not a number'
      end
      it 'prefecture_idが漢字では出品できない' do
        @product.prefecture_id = '漢'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefecture is not a number'
      end
      it 'prefecture_idが記号では出品できない' do
        @product.prefecture_id = '~'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefecture is not a number'
      end

      it 'delivery_day_idが空では出品できない' do
        @product.delivery_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Delivery day can't be blank"
      end
      it 'delivery_day_idが1では出品できない' do
        @product.delivery_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery day must be other than 1'
      end
      it 'delivery_day_idが半角英字では出品できない' do
        @product.delivery_day_id = 'a'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery day is not a number'
      end
      it 'delivery_day_idが全角英字では出品できない' do
        @product.delivery_day_id = 'ａ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery day is not a number'
      end
      it 'delivery_day_idがひらがなでは出品できない' do
        @product.delivery_day_id = 'あ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery day is not a number'
      end
      it 'delivery_day_idが半角ｶﾀｶﾅでは出品できない' do
        @product.delivery_day_id = 'ｱ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery day is not a number'
      end
      it 'delivery_day_idが全角カタカナでは出品できない' do
        @product.delivery_day_id = 'ア'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery day is not a number'
      end
      it 'delivery_day_idが漢字では出品できない' do
        @product.delivery_day_id = '漢'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery day is not a number'
      end
      it 'delivery_day_idが記号では出品できない' do
        @product.delivery_day_id = '~'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery day is not a number'
      end

      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが半角英字では出品できない' do
        @product.price = 'a'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが全角英字では出品できない' do
        @product.price = 'ａ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceがひらがなでは出品できない' do
        @product.price = 'あ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが半角ｶﾀｶﾅでは出品できない' do
        @product.price = 'ｱ'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが全角カタカナでは出品できない' do
        @product.price = 'ア'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが漢字では出品できない' do
        @product.price = '漢'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが記号では出品できない' do
        @product.price = '~'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが300未満では出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not included in the list"
      end
      it 'priceが9999999超では出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not included in the list"
      end

      it 'imageが空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end

      it 'userが紐付いていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "User must exist"
      end
    end
  end
end
