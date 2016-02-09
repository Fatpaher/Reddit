require 'rails_helper'

describe Link do
  describe 'validations' do
   it { should have_many(:comments) }
   it { should belong_to(:user) }
  end

  describe 'when user_id is not present' do
    link = FactoryGirl.build(:link)
    link.user_id = nil
    it { expect(link).to_not be_valid }
  end

  describe 'with blank title' do
    link = FactoryGirl.build(:link, title: '')
    it { expect(link).to_not be_valid }
  end

  describe 'with blank link' do
    link = FactoryGirl.build(:link, url: '')
    it { expect(link).to_not be_valid }
  end
end
