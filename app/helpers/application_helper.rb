module ApplicationHelper

	private

	def require_login
	  redirect_to root_path, flash: { notice: ["You must be logged in to view page"] } and return unless session[:user_id]
  end

  def title(page_title)
  	content_for :title, "Pub Gamer | " + page_title.to_s
  end

end
