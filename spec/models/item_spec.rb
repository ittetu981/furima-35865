require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '出品できるとき' do
      it 'product_nameとdescription_of_itemとcategory_id、delivery_charge_idとproduct_status_id、shipment_source_idとprice、shipping_charge_idとimageが存在すれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it '販売価格が¥300より少ない時は出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは300以上の値にしてください")
      end

      it '販売価格が¥9999999より多い時は出品できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは9999999以下の値にしてください")
      end

      it '販売価格が空では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end

      it '販売価格は半角数字以外では出品できないこと' do
        @item.price = '300a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end

      it '商品画像が空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Imageを入力してください")
      end

      it "商品名が空では出品できないこと" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product nameを入力してください")
      end

      it "商品の説明が空では出品できないこと" do
        @item.description_of_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description of itemを入力してください")
      end

      it "カテゴリーが空では出品できないこと" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryは数値で入力してください")
      end

     it "商品の状態が空では出品できないこと" do
        @item.product_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product statusは数値で入力してください")
      end

      it "配送料の負担の情報が空では出品できないこと" do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery chargeを入力してください")
      end

      it "発送元の地域の情報が空では出品できない" do
        @item.shipment_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment sourceを入力してください")
      end

      it 'カテゴリーのidに1が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end

      it '商品の状態のidに1が選択されている場合は出品できない' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product statusは1以外の値にしてください")
      end

      it '配送料の負担のidに1が選択されている場合は出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery chargeは1以外の値にしてください")
      end

      it '発送元の地域のidに1が選択されている場合は出品できない' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment sourceは1以外の値にしてください")
      end

      it '発送までの日数が空では出品できないこと' do
        @item.shipping_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping timeは数値で入力してください")
      end

      it '発送までの日数のidに1が選択されている場合は出品できない' do
        @item.shipping_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping timeは1以外の値にしてください")
      end

      it '商品価格が半角英字のみでは出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end

      it '商品価格が全角文字では出品できない' do
      @item.price = 'ａａａａ'
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end
    end
  end
end