class Item < ActiveRecord::Base
	belongs_to :seller, :foreign_key => :seller_id, class_name: "User"
	validates :title, :description, :price , presence: true
end