require 'rails_helper'

RSpec.describe PurchaseDeliveryAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @purchase_delivery_address = FactoryBot.build(:purchase_delivery_address)
    end

    context '商品購入情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_delivery_address).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @purchase_delivery_address.building = nil
        expect(@purchase_delivery_address).to be_valid
      end
    end

    context '商品購入情報の保存ができないとき' do
      it 'tokenが空だと保存できないこと' do
        @purchase_delivery_address.token = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと保存できないこと' do
        @purchase_delivery_address.post_code = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンがなければ保存できないこと' do
        @purchase_delivery_address.post_code = '1111111'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空だと保存できないこと' do
        @purchase_delivery_address.prefecture_id = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_delivery_address.city = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("City can't be blank")
      end

      it 'street_numberが空だと保存できないこと' do
        @purchase_delivery_address.street_number = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Street number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_delivery_address.phone_number = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @purchase_delivery_address.phone_number = '000000000000'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
