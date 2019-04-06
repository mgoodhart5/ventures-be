require 'rails_helper'

describe Event do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:event_type) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end
  
  describe 'Relationships' do
    it { should have_many(:users).through(:user_events) }
  end
end
