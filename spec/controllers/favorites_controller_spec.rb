require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
    context 'without sign in' do
        it 'show INDEX page' do
            get :index
            expect(response).to redirect_to('/login')
        end

        it 'no NEW page' do
            expect {get :new}.to raise_error(ActionController::UrlGenerationError)
        end

        it 'DESTROY favorite' do
            get :destroy, params: {recipe_id: 1}
            expect(response).to redirect_to('/login')
        end
    end

    context 'with sign in' do
        before(:each) do
            #login
            @user = create_user 
            login(@user)
        end

        it 'show INDEX page' do
            get :index
            expect(response).to render_template('favorites/index')
        end

        it 'no NEW page' do
            expect {get :new}.to raise_error(ActionController::UrlGenerationError)
        end

        it 'DESTROY favorite' do
            create_roaster
            create_bean
            create_recipe
            @favorite = create_favorite
            @favorite.destroy
            expect(response.status).to eq(200)
        end

        it 'CREATE favorite' do 
            create_roaster
            create_bean
            create_recipe
            @favorite = create_favorite
            expect(response.status).to eq(200)
        end
    
    end
end
