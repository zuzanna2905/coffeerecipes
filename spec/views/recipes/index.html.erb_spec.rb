require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  it "displays all the recipes" do
    create_user
    create_roaster
    create_bean
    assign(:recipes, [
      Recipe.create!(user_id: 1, bean_id: 1, roaster_id: 1, temperature: 90, water: 500, dose: 30, method: 'V60', grinder: 'Comandante', clicks: 15, time: Time.now, description: 'non', rate: 5, likes: 0),
      Recipe.create!(user_id: 1, bean_id: 1, roaster_id: 1, temperature: 90, water: 500, dose: 30, method: 'V60', grinder: 'Comandante', clicks: 15, time: Time.now, description: 'non', rate: 5, likes: 0)
    ]).paginate(page: params[:page], per_page: 6)

    render

    expect(rendered).to match /slicer/
    expect(rendered).to match /dicer/
  end
end
