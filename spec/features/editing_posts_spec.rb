require 'spec_helper.rb'

feature 'Edit post' do

  background do
  end

  scenario 'Update caption' do
    register
    new_post("This is post one")
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    expect(page.current_path).to eq(edit_post_path(1))
    fill_in 'Caption', with: 'Best ever coffee'
    click_button 'Update Post'
    expect(page).to have_content 'Best ever coffee'
    expect(page).to have_content 'Your post has been updated.'
  end

  scenario 'Can\'t update post without an image' do
    register
    new_post("This is post one")
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    attach_file 'Image', "spec/files/text/coffee.txt"
    click_button 'Update Post'
    expect(page).to have_content 'Something is wrong with your form'
  end
end
