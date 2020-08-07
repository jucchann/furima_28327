require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nickname、email、password、password_confirmation、family_name、first_name
            family_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end

        it 'emailに@があれば登録できる' do
          @user.email = 'kkk@gmail.com'
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できる' do
          @user.password = 'password0'
          @user.password_confirmation = 'password0'
          expect(@user).to be_valid
        end

        it 'family_nameが全角であれば登録できる' do
          @user.family_name = '山田'
          expect(@user).to be_valid
        end

        it 'first_nameが全角であれば登録できる' do
          @user.first_name = '太郎'
          expect(@user).to be_valid
        end

        it 'family_name_kanaが全角カタカナであれば登録できる' do
          @user.family_name_kana = 'ヤマダ'
          expect(@user).to be_valid
        end

        it 'first_name_kanaが全角カタカナであれば登録できる' do
          @user.first_name_kana = 'タロウ'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できない' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'emailに@がないと登録できない' do
          @user.email = 'kkkgmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'passwordが空では登録できない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下であれば登録できない' do
          @user.password = 'pass0'
          @user.password_confirmation = 'pass0'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'family_nameが空では登録できない' do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it 'first_nameが空では登録できない' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'family_nameが全角でない場合は登録できない' do
          @user.family_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name は全角で入力してください。')
        end

        it 'first_nameが全角でない場合は登録できない' do
          @user.first_name = 'tarou'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name は全角で入力してください。')
        end

        it 'family_name_kanaが空では登録できない' do
          @user.family_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end

        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'family_name_kanaが全角カタカナでない場合は登録できない' do
          @user.family_name_kana = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name kana は全角カタカナで入力して下さい。')
        end

        it 'first_name_kanaが全角カタカナでない場合は登録できない' do
          @user.first_name_kana = 'tarou'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力して下さい。')
        end

        it 'birthdayが空では登録できない' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
