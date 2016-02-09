require 'rails_helper'

describe Comment do
  describe 'validations' do
   it { should belong_to(:link) }
   it { should belong_to(:user) }
  end

  describe 'when user_id is not present' do
    comment = FactoryGirl.build(:comment)
    comment.link_id = nil
    it { expect(comment).to_not be_valid }
  end

  describe 'when link_id is not present' do
    comment = FactoryGirl.build(:comment)
    comment.user_id = nil
    it { expect(comment).to_not be_valid }
  end

  describe 'with blank body' do
    comment = FactoryGirl.build(:comment, body: '')
    it { expect(comment).to_not be_valid }
  end
end
