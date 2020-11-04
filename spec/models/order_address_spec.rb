require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.save
    @order = FactoryBot.build(:order, item_id: @item.id, user_id: @user.id)
  end

  describe '商品購入情報入力' do
    context '購入がうまくいくとき' do
      it 'クレジットカード情報、配送先のすべてが正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end

      it '商品(item)と出品者(user)が存在すれば保存ができること' do
        expect(@order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空だと購入できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角数字でハイフンを含んだ正しい形式でないと購入できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it '都道府県を選択していないと購入できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が空だと購入できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '建物名は空でも購入できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
      it '電話番号が空だと購入できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が半角数字でハイフンを含んでいない正しい形式でないと購入できないこと' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が11桁以内でないと購入できないこと' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '購入者が空では保存ができないこと' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '商品が空では保存ができないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Item must exist')
      end
      it '出品者が空では保存ができないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('User must exist')
      end
    end
  end
end
