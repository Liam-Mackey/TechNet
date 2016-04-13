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

	def destroy
		if logged_in?
			@item = Item.find(params[:id])
			if current_user.id == @item.seller_id
				@item.destroy
				head :no_content
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