# == Schema Information
#
# Table name: sports
#
#  id         :integer          not null, primary key
#  sport_name :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sport < ApplicationRecord
    validates :sport_name, presence: true, uniqueness: true

    has_many(
        :players,
        primary_key: :id,
        foreign_key: :sport_id,
        class_name: :Player,
        inverse_of: :sport,
        dependent: :destroy
    )
    include AvgAgeByPos
end
