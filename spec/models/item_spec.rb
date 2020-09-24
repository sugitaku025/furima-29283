require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test_image.jpg")
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "image,name,explanation,category_id,condition_id,postage_id,prefecture_id,sending_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end 
      it 'category_idで0が選択されていると出品できない' do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'condition_idが空だと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idで0が選択されていると出品できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it 'postage_idが空だと出品できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'postage_idで0が選択されていると出品できない' do
        @item.postage_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 0")
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idで0が選択されていると出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'sending_idが空だと出品できない' do
        @item.sending_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending can't be blank")
      end
      it 'sending_idで0が選択されていると出品できない' do
        @item.sending_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending must be other than 0")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300より少ない値だと出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9999999より大きい値だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceに半角数字以外の値が入力されていると出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end