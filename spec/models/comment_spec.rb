require 'rails_helper'

describe Comment do
  describe 'associations' do
   it { should belong_to(:link) }
   it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:link_id) }
    it { should validate_presence_of(:body) }
  end
end
