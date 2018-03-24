# == Schema Information
#
# Table name: sports
#
#  id         :integer          not null, primary key
#  sport_name :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'
require 'factory_bot'

RSpec.describe Sport, type: :model do
    subject(:sport) { FactoryBot.build(:sport) }

    describe 'validations' do
        it { should validate_presence_of(:sport_name) }
    end
end
