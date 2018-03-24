# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.destroy_all

# FILES
basketball_file = JSON.parse(File.read('./app/assets/javascripts/basketball.json'))
baseball_file = JSON.parse(File.read('./app/assets/javascripts/baseball.json'))
football_file = JSON.parse(File.read('./app/assets/javascripts/football.json'))

# BASKETBALL
basketball_avg_age = 0.00
statistically_significant_ages = 0

basketball = Sport.new({
    "sport_name" => "Basketball",
    "average_age" => "temp"
})


basketball_file["body"]["players"].each do |player|
    if player["age"]
        basketball_avg_age += player["age"]
        statistically_significant_ages += 1
    end

    basketball.players << Player.new({
        "first_name" => player["firstname"],
        "last_name" => player["lastname"],
        "position" => player["position"],
        "age" => (player["age"] ? player["age"] : nil),
        "sport_id" => 1
    })
end

basketball["average_age"] = basketball_avg_age / statistically_significant_ages
basketball.save!

# BASEBALL

baseball_avg_age = 0.00
statistically_significant_ages = 0

baseball = Sport.new({
    "sport_name" => "Baseball",
    "average_age" => "temp"
})


baseball_file["body"]["players"].each do |player|
    if player["age"]
        baseball_avg_age += player["age"]
        statistically_significant_ages += 1
    end

    baseball.players << Player.new({
        "first_name" => player["firstname"],
        "last_name" => player["lastname"],
        "position" => player["position"],
        "age" => (player["age"] ? player["age"] : nil),
        "sport_id" => 2
    })
end

baseball["average_age"] = baseball_avg_age / statistically_significant_ages
baseball.save

# FOOTBALL

football_avg_age = 0.00
statistically_significant_ages = 0

football = Sport.new({
    "sport_name" => "Football",
    "average_age" => "temp"
})


football_file["body"]["players"].each do |player|
    if player["age"]
        football_avg_age += player["age"]
        statistically_significant_ages += 1
    end

    football.players << Player.new({
        "first_name" => player["firstname"],
        "last_name" => player["lastname"],
        "position" => player["position"],
        "age" => (player["age"] ? player["age"] : nil),
        "sport_id" => 3
    })
end

football["average_age"] = football_avg_age / statistically_significant_ages
football.save!