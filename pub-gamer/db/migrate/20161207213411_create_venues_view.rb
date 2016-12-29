class CreateVenuesView < ActiveRecord::Migration
  def change
  	execute <<-SQL
  		CREATE OR REPLACE MATERIALIZED VIEW venues_view AS
  			SELECT 
  				v.id AS venue_id,
  				v.name AS venue,
  				v.address AS address,
  				g.id AS game_id,
  				g.name AS game,
  				n.id AS neighborhood_id,
  				n.name AS neighborhood
  		FROM venues v
  		INNER JOIN neighborhoods n ON n.id = v.neighborhood_id
  		INNER JOIN venue_games vg ON vg.venue_id = v.id
  		INNER JOIN games g ON g.id = vg.game_id
  	SQL
  end
end
