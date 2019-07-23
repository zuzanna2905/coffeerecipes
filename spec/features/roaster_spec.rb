require 'rails_helper'

RSpec.feature "Roasters", type: :feature do
  context 'create new roaster' do
    let(:roaster) { build :roaster }
    before(:each) do
      create_admin_and_log_in
    end

    scenario "should be successful" do
      visit new_roaster_path
      expect(page).to have_content 'Add new roaster'
      within find("form") do
        fill_in 'roaster_name', with: roaster.name
        fill_in 'roaster_country', with: roaster.country
      end
      click_button 'Add'
      expect(page).to have_content(roaster.name)
      expect(page).to have_content(roaster.country)
    end
  end

  context 'update roaster' do 
    let(:roaster) { create :roaster }
    before(:each) do
      create_admin_and_log_in
    end
    scenario "should be successful" do
      visit edit_roaster_path(roaster)
      within find("form") do
        fill_in 'roaster_name', with: roaster.name
        fill_in 'roaster_country', with: roaster.country
      end
      click_button 'Add'
      expect(page).to have_content(roaster.name)
      expect(page).to have_content(roaster.country)
    end
  end
end
