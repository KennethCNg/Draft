class Api::SportsController < ApplicationController

    # I was wondering if instead of having these three lines, I should have them in the concern so all the logic is there. 
    # I left them like this so it's more explicit as to what is happening when #index is being called. Would love feedback
    # as to whether this is the right move.
    def index
        # calls the methods in the AvgAgeByPos Model Concern
        sport, players = Sport.find_sport_and_players(params[:sport_name])
        avg_age_hash = sport.calculate_avg_age_by_position(players)
        json_obj = sport.create_json_response(players, avg_age_hash)

        render json: json_obj
    end
end
