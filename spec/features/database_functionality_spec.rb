feature 'Viewing Links' do

  scenario 'it contains a link' do
    #Link.create(url: 'https://makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end

  end
end
