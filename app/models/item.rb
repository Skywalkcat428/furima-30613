class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :category_id,        numericality: { other_than: 1 }
    validates :condition_id,       numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :prefecture_id,      numericality: { other_than: 1 }
    validates :delivery_date_id,   numericality: { other_than: 1 }
    validates :price,              { format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } }
  end

  belongs_to       :user
  has_many         :comments
  has_one          :order
  has_one_attached :image
end
