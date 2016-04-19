class ConversationsController < ApplicationController
	def create
		@conversation = Conversation.create_with(conversation_params).find_or_create_by(seller_id: params[:conversation][:seller_id], buyer_id: params[:conversation][:buyer_id])
		redirect_to conversation_path(@conversation)
	end

	def show
		@conversation = Conversation.find(params[:id])
	end

	def conversation_params
		params.require(:conversation).permit(:item_id, :seller_id, :buyer_id)
	end
end