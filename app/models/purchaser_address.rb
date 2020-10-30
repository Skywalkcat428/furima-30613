class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase
  attr_accessor :item, :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture, numericality: { other_than: 1 } 
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/ }
    validates :purchase

    validates :item
    validates :user
  end

  def save
    user = User.create()

end  