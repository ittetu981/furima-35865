require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
      before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、passwordとpassword_confirmation、full_width_surnameとfull_width_name、surname_yomiganaとname_yomigana、birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailは@が空では登録できないこと' do
      @user.email = 'hogehuga.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'お名前(全角)はfull_width_surnameが空では登録できないこと' do
      @user.full_width_surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width surname can't be blank")
    end

    it 'お名前(全角)はfull_width_nameが空では登録できないこと' do
      @user.full_width_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width name can't be blank")
    end

    it 'お名前カナ（全角）はsurname_yomiganaが空では登録できないこと' do
      @user.surname_yomigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname yomigana can't be blank")
    end

    it 'お名前カナ（全角）はname_yomiganaが空では登録できないこと' do
      @user.name_yomigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name yomigana can't be blank")
    end

    it 'お名前(全角)surnameは全角（漢字,ひらがな、カタカナ）での入力が必須であること' do
      @user.full_width_surname = 'full pitch character'
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width surname is invalid")
    end

    it 'お名前(全角)nameは全角（漢字,ひらがな、カタカナ）での入力が必須であること' do
      @user.full_width_name = 'full pitch character'
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width name is invalid")
    end

    it 'お名前カナ(全角)surnameは全角（カタカナ）での入力が必須であること' do
      @user.surname_yomigana = 'full pitch character'
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname yomigana is invalid")
    end

    it 'お名前カナ(全角)nameは全角（カタカナ）での入力が必須であること' do
      @user.name_yomigana = 'full pitch character'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name yomigana is invalid")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end