class ItemsController < ApplicationController
	def index
		@items = Item.includes(:seller).all.order(created_at: :desc).limit(10)
		if params[:search]
		  @items = Item.search(params[:search]).order("created_at DESC").limit(10)
		end
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
			render json: "You need to login to create Items", status: :unprocessable_entity
		end
	end

	def show
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if logged_in?
			if current_user.id == @item.seller_id
				@item.update(item_params)
				redirect_to root_path
			else
				redirect_to login_path
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
				redirect_to root_path
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