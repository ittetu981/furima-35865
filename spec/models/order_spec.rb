require 'rails_helper'

RSpec.describe Order, type: :model do
  RSpec.describe Order, type: :model do
    before do
      @order = FactoryBot.build(:order)
    end
  
    context '内容に問題ない場合' do
      it "カード番号と有効期限とセキュリティコードがあれば購入ができること" do
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "カード番号が空では購入ができないこと" do
        @order.number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Number can't be blank")
      end
  
      it "exp_monthが空では購入できないこと" do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Exp month can't be blank")
      end

      it "exp_yearが空では購入できないこと" do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Exp year can't be blank")
      end

      it "セキュリティコードが空では購入できないこと" do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Cvc can't be blank")
      end
    end
  end
end