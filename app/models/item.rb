class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category,

  #空の投稿を保存できないようにする
  validates :title, :text, :category, :condition, :delivery_charge, :prefecture, :delivery_date, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  
end
