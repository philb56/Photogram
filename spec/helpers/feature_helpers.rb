def register
  visit '/'
  click_link 'Register'
  fill_in 'user_email', with: 'a@b.com'
  fill_in 'user_user_name', with: 'Phil'
  fill_in 'user_password', with: 'aaaaaa'
  fill_in 'user_password_confirmation', with: 'aaaaaa'
  click_button 'Sign up'
end

def new_post(caption='nom nom nom #coffeetime')
  visit '/'
  click_link 'New Post'
  attach_file('Image', "spec/files/images/coffee.jpg")
  fill_in 'Caption', with: caption
  click_button 'Create Post'
end
