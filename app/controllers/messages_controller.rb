class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit , :destroy, :update]
	before_action :authenticate_user!, except: [:index ,:show]
	def index
		@messages = Message.all

	end
	def new 
		@message = current_user.messages.build
	end

	def create
		@message = current_user.messages.build(message_params)
		if @message.save
			redirect_to messages_path
		else
			render:new
		end

	end
	def edit

	end

	def update
		@message = Message.find(params[:id])
		if @message.update(message_params) 
			redirect_to messages_path
		else
			render:edit
		end
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy
		redirect_to messages_path
	end

	def show
	end

	private

		def message_params
			params.require(:message).permit(:title,:description)
		end

		def find_message
		@message = Message.find(params[:id])

		end
end
