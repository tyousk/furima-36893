class Item < ApplicationRecord
	has_one_attached :buy_record
	belongs_to :user
	has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
	belongs_to :statues
	belongs_to :fee
	belongs_to :prefecture
	belongs_to :send_day

	validates :category_id, :statues_id, :fee_id, :prefecture_id, :send_day_id, numericality: { other_than: 1 }
end
