require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できるとき' do

      it 'nicknameとemail、passwordとpassword_confirmation、full_width_surnameとfull_width_name、surname_yomiganaとname_yomigana、birthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do

      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailは@が空では登録できないこと' do
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end

      it 'passwordが全角では登録できない' do
        @user.password = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end

      it 'お名前(全角)はfull_width_surnameが空では登録できないこと' do
        @user.full_width_surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width surnameを入力してください")
      end

      it 'お名前(全角)はfull_width_nameが空では登録できないこと' do
        @user.full_width_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width nameを入力してください")
      end

      it 'お名前カナ（全角）はsurname_yomiganaが空では登録できないこと' do
        @user.surname_yomigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname yomiganaを入力してください")
      end

      it 'お名前カナ（全角）はname_yomiganaが空では登録できないこと' do
        @user.name_yomigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name yomiganaを入力してください")
      end

      it 'お名前(全角)surnameは全角（漢字,ひらがな、カタカナ）での入力が必須であること' do
        @user.full_width_surname = 'full pitch character'
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width surnameは不正な値です")
      end

      it 'お名前(全角)nameは全角（漢字,ひらがな、カタカナ）での入力が必須であること' do
        @user.full_width_name = 'full pitch character'
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width nameは不正な値です")
      end

      it 'お名前カナ(全角)surnameは全角（カタカナ）での入力が必須であること' do
        @user.surname_yomigana = 'full pitch character'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname yomiganaは不正な値です")
      end

      it 'お名前カナ(全角)nameは全角（カタカナ）での入力が必須であること' do
        @user.name_yomigana = 'full pitch character'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name yomiganaは不正な値です")
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdayを入力してください")
      end
    end
  end
end