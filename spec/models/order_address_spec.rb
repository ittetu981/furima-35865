require 'rails_helper'


RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.save
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1 
    end

    context '内容に問題ない場合' do
      it "postal_codetとshipment_source_id,municipality,addressとphone_numberがあれば保存ができること" do
        expect(@order_address).to be_valid
      end

      it '建物名が抜けてても登録できること' do
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "postal_codeが空では購入できないこと" do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeは「3桁ハイフン4桁」の半角文字列でなければ保存できないこと" do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "shipment_source_idが1では保存できないこと" do
        @order_address.shipment_source_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipment source must be other than 1")
      end

      it "municipalityが空では保存できないこと" do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it "addressが空では保存できないこと" do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では保存できないこと" do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberは10桁以上の半角数値でなければ保存できないこと" do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは11桁以内の半角数値でなければ保存できないこと" do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end