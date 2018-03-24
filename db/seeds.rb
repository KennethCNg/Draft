# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sport.destroy_all
Player.destroy_all

# FILES
basketball_file = JSON.parse(File.read('./app/assets/javascripts/basketball.json'))
baseball_file = JSON.parse(File.read('./app/assets/javascripts/baseball.json'))
football_file = JSON.parse(File.read('./app/assets/javascripts/football.json'))

# BASKETBALL
basketball = Sport.new({
    "sport_name" => "Basketball"
})
basketball_file["body"]["players"].each do |player|         
    basketball.players << Player.new({
        "first_name" => player["firstname"],
        "last_name" => player["lastname"],
        "position" => player["position"],
        "age" => (player["age"] ? player["age"] : nil),
        "sport_id" => 1
    })
end

basketball.save!

# BASEBALL
baseball = Sport.new({
    "sport_name" => "Baseball"
})


baseball_file["body"]["players"].each do |player|
    baseball.players << Player.new({
        "first_name" => player["firstname"],
        "last_name" => player["lastname"],
        "position" => player["position"],
        "age" => (player["age"] ? player["age"] : nil),
        "sport_id" => 2
    })
end

baseball.save!

# FOOTBALL
football = Sport.new({
    "sport_name" => "Football"
})

football_file["body"]["players"].each do |player|
    football.players << Player.new({
        "first_name" => player["firstname"],
        "last_name" => player["lastname"],
        "position" => player["position"],
        "age" => (player["age"] ? player["age"] : nil),
        "sport_id" => 3
    })
end

football.save!