require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    context 'without sign in' do
        let(:id) { 1 }
        it 'redirect to login from INDEX page' do
            get :index
            expect(response).to redirect_to('/login')
        end

        it 'redirect to login from SHOW page' do
            get :show, params: { id: id }
            expect(response).to redirect_to('/login')
        end

        it 'show NEW page' do
            get :new
            expect(response).to render_template('users/new')
        end

        it 'show EDIT page' do
            get :edit, params: { id: id }
            expect(response).to redirect_to('/login')
        end
    end
    
    context 'with sign in' do
        let(:user) {create :user}
        let(:second_user) {create(:user, email: 'user@gmail.com')}

        before(:each) do
            login(user)
        end

        it 'render INDEX' do
            get :index
            expect(response).to render_template('users/index')
        end

        it 'SHOW user page' do 
            get :show, params: { id: user }
            expect(response).to render_template("users/show")
        end

        it 'hide NEW page' do
            get :new
            expect(response).to redirect_to('/users')
        end

        it 'show my account EDIT page' do
            get :edit, params: { id: user }
            expect(response).to render_template("users/edit")
        end

        it 'redirect from another user account EDIT page' do
            get :edit, params: { id: second_user }
            expect(response).to redirect_to("/users/#{second_user.id}")
        end
    end
end