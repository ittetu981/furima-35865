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
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '販売価格が¥9999999より多い時は出品できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '販売価格が空では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は半角数字以外では出品できないこと' do
        @item.price = '300a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '商品画像が空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空では出品できないこと" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it "商品の説明が空では出品できないこと" do
        @item.description_of_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description of item can't be blank")
      end

      it "カテゴリーが空では出品できないこと" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

     it "商品の状態が空では出品できないこと" do
        @item.product_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end

      it "配送料の負担の情報が空では出品できないこと" do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it "発送元の地域の情報が空では出品できないこと" do
        @item.shipment_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source can't be blank")
      end
    end
  end
end
