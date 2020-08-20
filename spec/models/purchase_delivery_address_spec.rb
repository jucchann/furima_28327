require 'rails_helper'

RSpec.describe PurchaseDeliveryAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @seller = FactoryBot.create(:user)
      @buyer = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @purchase_delivery_address = FactoryBot.build(:purchase_delivery_address, user_id: @buyer.id, item_id: @item.id)
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
        expect(@purchase_delivery_address.errors.full_messages).to include("カードを入力してください")
      end

      it 'post_codeが空だと保存できないこと' do
        @purchase_delivery_address.post_code = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'post_codeにハイフンがなければ保存できないこと' do
        @purchase_delivery_address.post_code = '1111111'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('郵便番号はハイフンを入れてください')
      end

      it 'prefecture_idが空だと保存できないこと' do
        @purchase_delivery_address.prefecture_id = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("都道府県を入力してください")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_delivery_address.city = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'street_numberが空だと保存できないこと' do
        @purchase_delivery_address.street_number = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_delivery_address.phone_number = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @purchase_delivery_address.phone_number = '000000000000'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('電話番号は11文字以内で入力してください')
      end
    end
  end
end
