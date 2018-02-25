require 'rails_helper.rb'

feature 'multiple posts' do
  scenario 'the index displays correct created post information' do
    visit '/'
    register
    new_post("This is post one")
    new_post("This is the second post")
    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='coffee']")
  end
end
