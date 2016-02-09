require 'rails_helper'

describe Link do
  describe 'associations' do
   it { should have_many(:comments) }
   it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:title) }
  end
end
