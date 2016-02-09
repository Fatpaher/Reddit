require 'rails_helper'

describe User do
  describe 'associations' do
    it {should have_many(:links)}
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
  end

  describe 'when email format is invalid' do
   it 'should be invalid' do
     user = build(:user)
     addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
     addresses.each do |invalid_address|
       user.email = invalid_address
       expect(user).to_not be_valid
     end
   end
 end

 describe 'when email format is valid' do
   it 'should be valid' do
     user = build(:user)
     addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
     addresses.each do |valid_address|
       user.email = valid_address
       expect(user).to be_valid
     end
   end
 end

 describe 'when email address is already taken' do
   it 'should not be valid' do
     user = create(:user)
     user_with_same_email = user.dup
     user_with_same_email.email = user.email.upcase
     user_with_same_email.save
     expect(user_with_same_email).to_not be_valid
   end
 end
end
