feature 'Signing up' do
  scenario "Entering email and password in to signup form" do
    sign_up_with_confirmation

    expect(current_path).to eq '/links'
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content ("Welcome Sam@sam.com!")
    expect(User.first.email).to eq('Sam@sam.com')
  end

  scenario "Requires matching confirmation password" do
    expect { sign_up_with_confirmation(password_confirmation: 'non matching password')}.not_to change(User, :count)
  end
  scenario "Checks browser stays on users page if incorrect sign up"
    sign_up_with_confirmation(password_confirmation: 'non matching password')
    expect(current_path)
  end
end
