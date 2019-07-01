require 'rails_helper'

RSpec.describe HomeController, type: :controller do
    it 'show INDEX page' do
        get :index
        expect(response).to render_template('home/index')
    end
end
