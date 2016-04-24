class Item < ActiveRecord::Base
	belongs_to :seller, :foreign_key => :seller_id, class_name: "User"
	validates :title, :description, :price , presence: true
	has_many :conversations 

	def users_own_item?(id)
		self.seller_id == id
	end

	def self.search(search)
		where("title LIKE ?", "%#{search}%") 
	end
end