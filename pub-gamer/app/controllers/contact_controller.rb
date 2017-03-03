class ContactController < ApplicationController
	def index
		if request.xhr?
			render 'index'
		end
	end
end