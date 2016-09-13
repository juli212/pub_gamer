module ApplicationHelper

	private

	def require_login
  	redirect_to(root_path) and return unless session[:user_id]
  end
end
