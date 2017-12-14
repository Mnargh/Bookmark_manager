feature "Adding tags to links" do
  scenario "Tag is associated with a link in the database" do
    add_new_link_with_tag
    click_on 'Add Bookmark'
    link = Link.last
    expect(link.tags.map(&:name)).to include('Entertainment')
  end

  scenario "Adding multiple tags to a link" do
    visit 'links/new'
    fill_in :title, with: 'Vietnamase'
    fill_in :url, with: 'https://www.hakkasan.com'
    fill_in :tag, with: 'Food Vietnamese'
    click_on 'Add Bookmark'
    link = Link.last
    expect(link.tags.map(&:name)).to include('Food', 'Vietnamese')
  end
end
