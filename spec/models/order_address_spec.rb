require 'rails_helper'
describe OrderAddress do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test_image.jpg")
    @order = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "token、postal_code、prefecture_id、city、house_number、phone_numberが存在すれば購入できる" do
        expect(@order).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it "tokenが存在しなければ購入できない" do
        @order.token = ''
        @order .valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空では購入できない" do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンが存在しなければ購入できない" do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it "prefecture_idが空では購入できない" do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idで0が選択されていると購入できない" do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "cityが空では購入できない" do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では購入できない" do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では購入できない" do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが12桁以上であれば登録できない" do
        @order.phone_number = '111111111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
