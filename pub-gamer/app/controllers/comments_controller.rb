class CommentsController < ApplicationController
	before_filter :require_login
	
	def create
		@event = Event.find_by(id: params[:event_id])
		if @event.deleted
			redirect_to event_path(@event)
		elsif @event.attending_event?(current_user) || @event.user == current_user
			@comment = Comment.new(comment_params)
			@comment.user_id = current_user.id
			@comment.event_id = @event.id
			if request.xhr? && @comment.save
				render partial: '/comments/comment', locals: { comment: @comment }
			elsif @comment.save
				redirect_to event_path(@event)
			elsif request.xhr?
				render partial: '/shared/empty'
			else
				@errors = @comment.errors.full_messages
				redirect_to event_path(@event), flash: { error: @errors }
			end
		end
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end