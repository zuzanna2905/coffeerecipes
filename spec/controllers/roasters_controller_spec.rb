require 'rails_helper'

RSpec.describe RoastersController, type: :controller do
    let(:roaster) { create :roaster}
    it 'render the INDEX' do
        get :index
        expect(response).to render_template('index')
    end
    
    it 'SHOW roaster' do
        get :show, params: { id: roaster }
        expect(response).to render_template('show')
    end

    context 'without sign in' do
        it 'NEW roaster' do
            get :new
            expect(response).to redirect_to('/login')
        end
    end

    context 'user' do
        let(:user) { create :user}
        before(:each) do
            login(user)
        end

        it 'NEW roaster' do
            get :new
            expect(response).to redirect_to('/recipes')
        end
    end

    context 'admin' do
        let(:user) { create :user, :admin}
        before(:each) do
            login(user)
        end
        it 'NEW roaster' do
            get :new
            expect(response).to render_template('new')
        end
    end
end
