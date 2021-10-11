class Item < ApplicationRecord
	has_one_attached :buy_record
	belongs_to :user
	has_one_attached :image
end
