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

require 'rails_helper'
require 'factory_bot'

RSpec.describe Player, type: :model do
    subject(:player) { FactoryBot.build(:player) }

    describe 'validations' do
        it { should validate_presence_of(:sport_id) }
    end
end

