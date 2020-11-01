require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "itemとuserがあれば保存ができること" do
    expect(@order).to be_valid
  end

  it "itemが空では保存ができないこと" do
    @order.item = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Item can't be blank")
  end
  it "userが空では保存ができないこと" do
    @order.user = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("User can't be blank")
  end
end
