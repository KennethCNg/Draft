class Api::SportsController < ApplicationController
    def index
        @average_age, @players = Sport.find_sports_players(params[:sport_name])

        render :index
    end

end
