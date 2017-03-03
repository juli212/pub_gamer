module FormUpdater
  
  def add_games
    if params[:venue]
      game = Game.find_or_create_by(name: params[:venue][:game].downcase)
      render partial: 'add_game', locals: { game: game }
    else
      respond_to do |format|
        format.json { @results = Game.add_game(params[:term]).sort_by { |game| game.name } }
      end
    end
  end

end