# == Schema Information
#
# Table name: sports
#
#  id          :integer          not null, primary key
#  sport_name  :string           not null
#  average_age :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sport < ApplicationRecord
    validates :sport_name, :average_age, presence: true
    validates :sport_name, uniqueness: true

    has_many(
        :players,
        primary_key: :id,
        foreign_key: :sport_id,
        class_name: :Player,
        inverse_of: :sport
    )

    def self.find_sports_players(sport_name)
        sport = self.where("sport_name = ?", sport_name.capitalize)
        return sport[0].average_age, sport[0].players.reverse
    end

end
