module AvgAgeByPos
    extend ActiveSupport::Concern

    included do

        # this returns an instance of a sport (either basketball, baseball, or football) AND 
        # an array of players of that sport.

        def self.find_sport_and_players(sport_name)
            sport = self.where("sport_name = ?", sport_name.capitalize)[0]
            players = sport.players.sort_by { |player| player.id }
            return sport, players
        end
        

        # #calculate_avg_age_by_position
        # INPUT ex. 
        #   [{
        #       id: 1,
        #       first_name: "Alex", 
        #       last_name: "Abrines"
        #       position: "SG",
        #       age: 24,
        #       sport_id: 1
        #    }...]

        # OUTPUT ex. 
        # {"SF" => {
        #   total_players_at_position => 123,
        #   total_age => 4567
        # }}

        def calculate_avg_age_by_position(players)
            positions_hash = {}
            players.each do |player|
                if player.age
                    position = player.position    
                    if positions_hash[position]    
                        positions_hash[position]["total_players_at_position"] += 1
                        positions_hash[position]["total_age"] +=  player.age
                    else
                        positions_hash[position] = {
                            "total_players_at_position" => 1.00,
                            "total_age" => player.age
                        }
                    end
                end
            end    
            create_avg_age_hash(positions_hash)
        end
    
        # helper method for #calculate_avg_age_by_position
        def create_avg_age_hash(positions_hash)
            res = {}
            positions_hash.each_key do |position|
                num_players = positions_hash[position]["total_players_at_position"]
                total_age = positions_hash[position]["total_age"]
                res[position] = total_age / num_players
            end
            res
        end
    
        # creates the final json response object
        def create_json_response(players, avg_age_hash)
            players.map do |player|
                {   
                    "id" => player.id,
                    "name_brief" => player.name_brief,
                    "first_name" => player.first_name,
                    "last_name" => player.last_name,
                    "position" => player.position,
                    "age" => player.age,
                    "average_position_age_diff" => player.age ? player.age - avg_age_hash[player.position] : nil
                }
            end
        end 
    end
end