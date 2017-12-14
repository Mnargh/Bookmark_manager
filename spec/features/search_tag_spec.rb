require 'pry'

feature "searching for tags" do
  scenario "choosing which tag to search for in links" do
    add_sky_sports
    add_link_with_sports_tag
    click_on "Add Bookmark"
    add_new_link_with_tag
    click_on "Add Bookmark"

    fill_in :search_tag, with: "Sport"
    click_on "Search tag"

    expect(page.status_code).to eq 200
    expect(page).to have_content "BBC"
    expect(page).to have_content "Sky"
    expect(page).not_to have_content "Youtube"
  end
end
