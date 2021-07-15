require 'rails_helper'

RSpec.describe Order, type: :model do
  RSpec.describe Order, type: :model do
    before do
      @order = FactoryBot.build(:order)
    end
  
    context '内容に問題ない場合' do
      it "priceとtokenがあれば保存ができること" do
        expect(@order).to be_valid
      end

      it "postal_codetとshipment_source_id,municipality,addressとphone_numberがあれば保存ができること" do
        expect(@order).to be_valid
    end
  
    context '内容に問題がある場合' do
      it "priceが空では保存ができないこと" do
        @order.price = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
  
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空では購入できないこと" do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it "shipment_source_idが空では購入できないこと" do
        @order.shipment_source_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipment source can't be blank")
      end

      it "municipalityが空では購入できないこと" do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it "addressが空では購入できないこと" do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では購入できないこと" do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
end