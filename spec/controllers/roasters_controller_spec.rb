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
end
