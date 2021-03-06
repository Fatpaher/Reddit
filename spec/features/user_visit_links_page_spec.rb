require 'rails_helper'

describe 'User visit links page' do
  it 'sees all links content' do
    links = create_list(:link, 4)
    visit links_path
    links.each do |link|
      link_content(link)
    end
  end

  describe 'when User not sign in' do
    it 'should be able to sign in and sign up' do
      visit links_path
      expect(page).to have_link('Sign in', new_user_session_path)
      expect(page).to have_link('Sign up', new_user_registration_path)
    end
  end

  describe 'when User signed in' do
    it 'should be able to sign out' do
      user = create(:user)
      login_as user
      visit links_path
      expect(page).to have_link('Sign out', destroy_user_session_path)
    end
  end
end

def link_content(link)
  expect(page).to have_content(link.title)
  expect(page).to have_content(link.user.email)
  expect(page).to have_link('Visit URL', link.url)
  expect(page).to have_content(link.get_upvotes.size)
  expect(page).to have_content(link.get_downvotes.size)
end
