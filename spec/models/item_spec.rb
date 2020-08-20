require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品情報の保存' do
    context '商品情報の保存ができるとき' do
      it 'image、name、description、category_id、condition_id、delivery_fee_id、delivery_from_id、delivery_days_id、priceが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報の保存ができないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'descriptionが空では登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'category_idが空では登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは数値で入力してください")
      end

      it 'condition_idが空では登録できない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は数値で入力してください")
      end

      it 'delivery_fee_idが空では登録できない' do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は数値で入力してください")
      end

      it 'delivery_from_idが空では登録できない' do
        @item.delivery_from = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は数値で入力してください")
      end

      it 'delivery_days_idが空では登録できない' do
        @item.delivery_days = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は数値で入力してください")
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      it 'priceは¥300以上でないと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300より大きい値にしてください')
      end

      it 'priceは¥9999999以下でないと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999より小さい値にしてください')
      end
    end
  end
end
