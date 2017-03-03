class GamesController < ApplicationController

	def add_game
		if request.xhr?
			if params[:term]
				respond_to do |format|
					format.json { @results = Game.add_game(params[:term]).sort_by { |game| game.name } }
				end
			elsif params[:event] || params[:venue]
				params[:event] ? game_name = params[:event][:game] : game_name = params[:venue][:game]
				if game_name.length > 2
					game = Game.find_or_create_by(name: game_name.downcase)
					render partial: '/shared/add_game', locals: { game: game }
				end
			end
		end
	end

end