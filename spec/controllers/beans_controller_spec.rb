require 'rails_helper'

RSpec.describe BeansController, type: :controller do
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
            get :edit, params: { id: 1 }
            expect(response).to redirect_to('/login')
        end

        it 'SHOW bean page' do
            create_roaster
            @bean = create_bean
            get :show, params: { id: @bean.id }
            expect(response).to render_template('show')
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
            expect(response).to render_template('beans/index')
        end

        it 'show NEW page' do
            get :new
            expect(response).to render_template('beans/new')
        end

        it 'show EDIT page' do
            create_roaster
            @bean = create_bean
            get :edit, params: { id: @bean.id }
            expect(response).to redirect_to('/beans')
        end

        it 'SHOW bean page' do
            create_roaster
            @bean = create_bean
            get :show, params: { id: @bean.id }
            expect(response).to render_template('show')
        end
    end

    context 'with admin sign in' do
        before(:each) do
            #login
            @user = create_admin 
            login(@user)
        end

        it 'show EDIT page', :admin do
            create_roaster
            @bean = create_bean
            get :edit, params: { id: @bean.id }
            expect(response).to render_template('beans/edit')
        end
    end
end
