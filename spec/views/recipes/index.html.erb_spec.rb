require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  it "displays all the recipes" do
    create_user
    create_roaster
    create_bean
  end
end
