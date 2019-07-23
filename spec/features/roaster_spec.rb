require 'rails_helper'

RSpec.feature "Roasters", type: :feature do
  context 'create new roaster' do
    let(:roaster) { build :roaster }

    scenario "should be successful" do
      visit '/roasters/new'
      within("form") do
        fill_in 'name', with: roaster.name
        fill_in 'country', with: roaster.country
      end
      click_button 'Create Roster'
      expect(page).to have_content 'Roaster was successfully created.'
    end

  end
end
