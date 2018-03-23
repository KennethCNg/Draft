# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  position   :string
#  age        :integer
#  sport_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ApplicationRecord
    
end
