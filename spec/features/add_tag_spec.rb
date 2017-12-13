feature "Adding tags to links" do
  scenario "Tag is associated with a link in the database" do
    add_new_link_with_tag
    click_on 'Add Bookmark'
    link = Link.last
    p link.tags
    expect(link.tags.map(&:name)).to include('Entertainment')
  end
end
