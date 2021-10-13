class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :buy_record
  belongs_to :user
  has_one_attached :image
  validates :name, :about, :price, :image, presence: true
  belongs_to :category
  belongs_to :statues
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :send_day

  validates :category_id, :statues_id, :fee_id, :prefecture_id, :send_day_id, numericality: { other_than: 1 }
  validates_inclusion_of :price, in: 300..9999999
  validates :price, numericality: true
end
