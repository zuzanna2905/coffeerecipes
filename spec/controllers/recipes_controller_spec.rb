require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
    context 'without sign in' do
        let(:id) { 1 }
        let(:recipe) { create :recipe }

        it 'show INDEX page' do
            get :index
            expect(response).to render_template('recipes/index')
        end

        it 'redirect to login from NEW page' do
            get :new
            expect(response).to redirect_to('/login')
        end

        it 'show EDIT page' do
            get :edit, params: { id: id }
            expect(response).to redirect_to('/login')
        end

        it 'SHOW recipe page' do
            get :show, params: { id: recipe }
            expect(response).to render_template('recipes/show')
        end

        it 'TABLE recipes page' do
            get :table
            expect(response).to render_template('recipes/table')
        end
    end

    context 'with sign in' do
        let(:user) { create :random_user }
        let(:second_user) { create :random_user  }
        let(:recipe) { create :recipe, user: user }
        let(:second_recipe) { create(:recipe, user: second_user) }

        before(:each) do
            login(user)
        end

        it 'show INDEX page' do
            get :index
            expect(response).to render_template('recipes/index')
        end

        it 'show NEW page' do
            get :new
            expect(response).to render_template('recipes/new')
        end

        it 'show EDIT page of user recipe' do
            get :edit, params: { id: recipe }
            expect(response).to render_template('recipes/edit')
        end

        it 'show EDIT page of another user recipe' do
            get :edit, params: { id: second_recipe }
            expect(response).to redirect_to('/recipes')
        end

        it 'SHOW recipe page' do
            get :show, params: { id: recipe }
            expect(response).to render_template('recipes/show')
        end

        it 'TABLE recipes page' do
            get :table
            expect(response).to render_template('recipes/table')
        end
    end
end
