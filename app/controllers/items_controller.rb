class ItemsController < ApplicationController
	def index
		@items = Item.includes(:seller).all
	end

	def create 
		@item = Item.new(item_params)
		if logged_in?
			@item.seller_id = current_user.id
			if @item.save
			  render json: @item
			else
			  render json: @item.errors, status: :unprocessable_entity
			end
		else
			redirect_to login_path
		end
	end

	private
		def item_params
			params.require(:item).permit(:title, :description, :price, :photo_url)
		end
end