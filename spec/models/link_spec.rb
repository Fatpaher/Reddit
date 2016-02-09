require 'rails_helper'

describe Link do
  describe 'associations' do
   it { is_expected.to have_many(:comments) }
   it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:title) }
  end
end
