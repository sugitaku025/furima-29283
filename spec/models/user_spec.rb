require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name,furigana_last_nameとfurigana_first_name、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが半角英数字での混在で6文字以上あれば登録できる" do
        @user.password = "00000a"
        expect(@user).to be_valid
      end
      it "last_nameが(漢字、平仮名、カタカナ)で存在すれば登録できる" do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end
      it "first_nameが(漢字、平仮名、カタカナ)で存在すれば登録できる" do
        @user.first_name = "一郎"
        expect(@user).to be_valid
      end
      it "furigana_last_nameがカタカナで存在すれば登録できる" do
        @user.furigana_last_name = "ヤマダ"
        expect(@user).to be_valid
      end
      it "furigana_first_nameがカタカナで存在すれば登録できる" do
        @user.furigana_first_name = "イチロウ"
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordがアルファベットのみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "last_nameに英数字が含まれると登録できない" do
        @user.last_name = "鈴木1a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it  "first_nameに英数字が含まれると登録できない" do
        @user.first_name = "一郎1a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "furigana_last_nameが空だと登録できない" do
        @user.furigana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last name can't be blank")
      end
      it "furigana_last_nameがカタカナ以外では登録できない" do
        @user.furigana_last_name = "鈴木"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last name is invalid")
      end
      it "furigana_first_nameが空だと登録できない" do
        @user.furigana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first name can't be blank")
      end
      it "furigana_first_nameがカタカナ以外では登録できない" do
        @user.furigana_first_name = "一郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first name is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end