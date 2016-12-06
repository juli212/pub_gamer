def add_games
	if params[:term]
		respond_to do |format|
			format.json { @results = Game.add_game(params[:term]).sort_by { |game| game.name } }
		end
	elsif params[:event]
		game = Game.find_or_create_by(name: params[:event][:game].downcase)
	elsif params[:venue]
		game = Game.find_or_create_by(name: params[:venue][:game].downcase)
	end
	render partial: '/shared/add_game', locals: { game: game }
end