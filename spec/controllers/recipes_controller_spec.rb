require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
    context 'without sign in' do
        it 'show INDEX page' do
            get :index
            expect(response).to render_template('recipes/index')
        end

        it 'redirect to login from NEW page' do
            get :new
            expect(response).to redirect_to('/login')
        end

        it 'show EDIT page' do
            get :edit, params: { id: 1 }
            expect(response).to redirect_to('/login')
        end

        it 'SHOW recipe page' do
            create_user
            create_roaster
            create_bean
            @recipe = create_recipe
            get :show, params: { id: @recipe }
            expect(response).to render_template('recipes/show')
        end

        it 'TABLE recipes page' do
            get :table
            expect(response).to render_template('recipes/table')
        end
    end

    context 'with sign in' do
        before do |test|
            unless test.metadata[:skip_before]
                #login
                @user = create_user 
                login(@user)
            end
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
            create_roaster
            create_bean
            @recipe = create_recipe
            get :edit, params: { id: @recipe }
            expect(response).to render_template('recipes/edit')
        end

        it 'show EDIT page of another user recipe', :skip_before do
            create_user
            @user = create_user2
            login(@user)
            create_roaster
            create_bean
            @recipe = create_recipe
            get :edit, params: { id: @recipe }
            expect(response).to redirect_to('/recipes')
        end

        it 'SHOW recipe page' do
            create_roaster
            create_bean
            @recipe = create_recipe
            get :show, params: { id: @recipe }
            expect(response).to render_template('recipes/show')
        end

        it 'TABLE recipes page' do
            get :table
            expect(response).to render_template('recipes/table')
        end
    end
end
