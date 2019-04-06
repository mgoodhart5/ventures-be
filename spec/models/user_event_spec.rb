require 'rails_helper'

describe UserEvent do
  describe 'Validations' do
    it { should validate_presence_of(:status) }
  end
  
  describe 'Relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end
end