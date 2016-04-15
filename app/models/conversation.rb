class Conversation < ActiveRecord::Base
	belongs_to :seller, :foreign_key => :seller_id, class_name: "User"
	belongs_to :buyer, :foreign_key => :buyer_id, class_name: "User"
	belongs_to :item
	has_many :messages, dependent: :destroy
end