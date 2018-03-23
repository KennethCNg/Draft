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
end
