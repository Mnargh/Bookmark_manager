def add_new_link_with_tag
  visit '/links/new'
  fill_in :title, with: 'Youtube'
  fill_in :url, with: 'https://youtube.com'
  fill_in :tag, with: 'Entertainment'
  # click_on 'Add Bookmark'
end
