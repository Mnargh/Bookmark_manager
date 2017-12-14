feature 'Creating Links' do

  scenario 'links can be saved by the user' do
    visit '/links/new'
    fill_in :title, with: 'Guardian'
    fill_in :url, with: 'https://guardian.com'
    fill_in :tag, with: 'News'
    click_on 'Add Bookmark'

    within 'ul#links' do
      expect(page).to have_content('Guardian')
    end

  end

  scenario 'bookmark creation page can be accessed via a button on bookmark list' do
    visit '/links'
    click_button 'Add Bookmark'
    expect(current_path).to eq '/links/new'
  end

end
