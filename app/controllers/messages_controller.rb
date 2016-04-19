class MessagesController < ApplicationController
	def create
		@message = Message.create(message_params)
	end

	def message_params
		params.require(:message).permit(:user_id, :conversation_id, :body)
	end
end