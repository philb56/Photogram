feature 'Deleting posts' do
  scenario 'should be able to delete post' do
    visit '/'
    register
    new_post
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    click_link 'Delete Post'
    expect(page.current_path).to eq(posts_path)
    expect(page).to have_content 'Your post has been deleted.'
  end
end
