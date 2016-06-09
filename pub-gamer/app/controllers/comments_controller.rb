class CommentsController < ApplicationController
	def create
		binding.pry
		@event = Event.find_by(id: params[:event_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id 
		@comment.event_id = @event.id
		if @comment.save
			redirect_to event_path(@event)
		else
			@errors = @comment.errors.full_messages
			redirect_to event_path(@event)
		end
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end