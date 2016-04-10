class ItemsController < ApplicationController
	def index
		@items = Item.includes(:seller).all
	end
end