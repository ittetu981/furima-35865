require 'rails_helper'


RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '内容に問題ない場合' do
      it "postal_codetとshipment_source_id,municipality,addressとphone_numberがあれば保存ができること" do
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

      it "shipment_source_idが空では保存できないこと" do
        @order_address.shipment_source_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipment source can't be blank")
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
    end
  end
end