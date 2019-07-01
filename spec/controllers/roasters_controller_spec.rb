require 'rails_helper'

RSpec.describe RoastersController, type: :controller do
    it 'render the INDEX' do
        get :index
        expect(response).to render_template('index')
    end
    
    it 'SHOW roaster' do
        @roaster = create_roaster
        get :show, params: { id: @roaster.id }
        expect(response).to render_template('show')
    end
end
