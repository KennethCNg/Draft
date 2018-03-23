json.array!(@players) do |player|
    json.id player.id
    json.name_brief player.name_brief
    json.first_name player.first_name
    json.last_name player.last_name
    json.position player.position
    json.age player.age
    json.average_position_age_diff (player.age ? player.age - @average_age : nil)
end