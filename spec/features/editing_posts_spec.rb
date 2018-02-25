require 'spec_helper.rb'

feature 'Edit post' do
  scenario 'Update caption' do
    post = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
    click_link 'Edit Post'
    expect(page.current_path).to eq(edit_post_path(post))
    fill_in 'Caption', with: 'Best ever coffee'
    click_button 'Update Post'
    expect(page).to have_content 'Best ever coffee'
    expect(page).to have_content 'Your post has been updated.'
  end
end
