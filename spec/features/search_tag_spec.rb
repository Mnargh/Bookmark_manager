feature "searching for tags" do
  scenario "choosing which tag to search for in links" do
    visit '/links/new'
    fill_in :title, with: 'Sky Sports'
    fill_in :url, with: 'http://www.bbc.co.uk/sport'
    fill_in :tag, with: 'Sport'
    click_on "Add Bookmark"

    add_new_link_with_tag
    click_on "Add Bookmark"
    add_link_with_sports_tag
    click_on "Add Bookmark"
    fill_in :tag_search, with: "Sport"

    click_on "Search tag"

    expect(page).to have_content "BBC Sport"
    expect(page).to have_content "Sky Sports"
    expect(page).not_to have_content "Youtube"
  end
end
