class BuyRecord < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions 
	
  belongs_to :user
  belongs_to :item
  has_one :address
end
