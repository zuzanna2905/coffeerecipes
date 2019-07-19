require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
    context 'without sign in' do
        let(:favorite) { build :favorite }

        it 'show INDEX page' do
            get :index
            expect(response).to redirect_to('/login')
        end

        it 'no NEW page' do
            expect {get :new}.to raise_error(ActionController::UrlGenerationError)
        end

        it 'DESTROY favorite' do
            post :destroy, params: { recipe_id: favorite.recipe }
            expect(response).to redirect_to('/login')
        end
    end

    context 'with sign in' do
        let(:user) { build :user }
        let(:favorite) { create(:favorite, user: user) }

        before(:each) do
            login(favorite.user)
        end

        it 'show INDEX page' do
            get :index
            expect(response).to render_template('favorites/index')
        end

        it 'no NEW page' do
            expect {get :new}.to raise_error(ActionController::UrlGenerationError)
        end

        it 'DESTROY favorite' do
            post :destroy, params: { recipe_id: favorite.recipe }
            expect(response.status).to eq(200)
        end

        it 'CREATE favorite' do 
            favorite
            expect(response.status).to eq(200)
        end
    
    end
end
