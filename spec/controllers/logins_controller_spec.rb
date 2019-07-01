require 'rails_helper'

RSpec.describe LoginsController, type: :controller do
    it 'show NEW page' do
        get :new
        expect(response).to render_template('logins/new')
    end

    it 'redirect to recipes from NEW if is logged in' do
        @user = create_user 
        login(@user)
        get :new
        expect(response).to redirect_to('/recipes')
    end
end
