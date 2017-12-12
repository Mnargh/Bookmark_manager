feature 'Creating Links' do

  scenario 'links can be saved by the user' do
    visit '/links/new'
    fill_in :title, with: 'Youtube'
    fill_in :url, with: 'https://youtube.com'
    click_on 'Add Bookmark'

    within 'ul#links' do
      expect(page).to have_content('Youtube')
    end

  end

end
