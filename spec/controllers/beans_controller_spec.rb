require 'rails_helper'

RSpec.describe BeansController, type: :controller do
    let(:bean) { create :bean }
    
    context 'without sign in' do
        it 'show INDEX page' do
            get :index
            expect(response).to render_template('beans/index')
        end

        it 'redirect to login from NEW page' do
            get :new
            expect(response).to redirect_to('/login')
        end

        it 'show EDIT page' do
            get :edit, params: { id: bean }
            expect(response).to redirect_to('/login')
        end

        it 'SHOW bean page' do
            get :show, params: { id: bean }
            expect(response).to render_template('show')
        end
    end

    context 'with sign in' do
        let(:user) { create :user }
        before(:each) do
            login(user)
        end

        it 'show INDEX page' do
            get :index
            expect(response).to render_template('beans/index')
        end

        it 'show NEW page' do
            get :new
            expect(response).to render_template('beans/new')
        end

        it 'show EDIT page' do
            get :edit, params: { id: bean }
            expect(response).to redirect_to('/recipes')
        end

        it 'SHOW bean page' do
            get :show, params: { id: bean }
            expect(response).to render_template('show')
        end
    end

    context 'with admin sign in' do
        let(:admin) { create :random_user, :admin }
        before(:each) do
            login(admin)
        end

        it 'show EDIT page', :admin do
            get :edit, params: { id: bean }
            expect(response).to render_template('beans/edit')
        end
    end
end