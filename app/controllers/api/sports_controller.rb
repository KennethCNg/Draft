class Api::SportsController < ApplicationController
    def index
        # calls the methods in the AvgAgeByPos Concern
        sport, players = Sport.find_sport_and_players(params[:sport_name])
        avg_age_hash = sport.calculate_avg_age_by_position(players)
        json_obj = sport.create_json_response(players, avg_age_hash)

        render json: json_obj
    end

end
