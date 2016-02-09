require 'rails_helper'

describe 'User visit link page' do
 it 'should include link information' do
   link = create :link
   visit link_path(link)
   expect(page).to have_link(link.title, link.url)
   expect(page).to have_content(link.user.email)
   expect(page).to have_link('Visit URL', link.url)
   expect(page).to have_content(link.get_upvotes.size)
   expect(page).to have_content(link.get_downvotes.size)
 end

 it "can't leave comments when not signed in" do
   link = create :link
   visit link_path(link)
   expect(page).to have_content('You must be sign in to leave a comment')
   expect(page).to_not have_content('Add comment')
 end

 it 'can leave new comment to the post' do
   link = create :link
   user = create :user
   login_as user
   visit link_path(link)
   fill_in 'comment_body', with: 'Some text'
   click_button 'Add Comment'
   expect(page).to have_content('Some text')
 end

 it 'sees other users comments' do
   other_user = create :user
   link = create :link
   comment = create :comment, user_id: other_user.id, link_id:link.id
   visit link_path(link)
   expect(page).to have_content(comment.body)
 end

end
