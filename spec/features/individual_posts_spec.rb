require 'rails_helper.rb'
feature 'click on an image link' do
  scenario 'go to show page' do
    register
    new_post("This is post one")
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(1))
  end
end
