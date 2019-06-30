require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    context 'without sign in' do
        it 'redirect to login from index page' do
            get :index
            expect(response).to redirect_to('/login')
        end

        it 'redirect to login from show page' do
            get :show, params: { id: 1 }
            expect(response).to redirect_to('/login')
        end

        it 'show new page' do
            get :new
            expect(response).to render_template('users/new')
        end

        it 'show edit page' do
            get :edit, params: { id: 1 }
            expect(response).to redirect_to('/login')
        end
    end
    
    context 'with sign in' do
        before(:each) do
            #login
            @user = create_user
            login(@user)
        end

        it 'render index' do
            get :index
            expect(response).to render_template('users/index')
        end

        it 'show user page' do 
            get :show, params: { id: @user.id }
            expect(response).to render_template("users/show")
        end

        it 'hide new page' do
            get :new
            expect(response).to redirect_to('/users')
        end

        it 'show my account edit page' do
            get :edit, params: { id: @user.id }
            expect(response).to render_template("users/edit")
        end

        it 'redirect from other user account edit page' do
            @user2 = User.create!(name: 'Arya', email: 'arya@gmail.com', password: 'arya123', password_confirmation: 'arya123')
            get :edit, params: { id: @user2.id }
            expect(response).to redirect_to("/users/#{@user2.id}")
        end
    end
end