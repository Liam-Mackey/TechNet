class ConversationsController < ApplicationController
	def create
		@conversation = Conversation.new(conversation_params)
		if @conversation.save
			redirect_to conversation_path(@conversation)
		else
			redirect_to root_path
		end
	end

	def show
		@conversation = Conversation.find(params[:id])
	end

	def conversation_params
		params.require(:conversation).permit(:item_id, :seller_id, :buyer_id)
	end
end