class User < ActiveRecord::Base
	has_many :sales, class_name: "Item", foreign_key: :seller_id, dependent: :destroy
	validates :username, presence: true, uniqueness: true
	validates :first_name, :last_name, presence: true
	has_many :written_messages, class_name: "Conversation", foreign_key: :buyer_id, dependent: :destroy
	has_many :recieved_messages, class_name: "Conversation", foreign_key: :seller_id, dependent: :destroy
	has_secure_password

end