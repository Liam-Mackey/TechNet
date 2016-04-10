class User < ActiveRecord::Base
	has_many :sales, class_name: "Item", foreign_key: :seller_id, dependent: :destroy
	validates :username, presence: true, uniqueness: true
	has_secure_password
end