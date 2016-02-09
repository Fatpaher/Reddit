require 'rails_helper'

describe Comment do
  describe 'associations' do
   it { is_expected.to belong_to(:link) }
   it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:link_id) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
