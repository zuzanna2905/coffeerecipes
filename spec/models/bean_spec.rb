require 'rails_helper'

RSpec.describe Bean, type: :model do
  subject { described_class.new(name: 'Peru El Diamante', method: 'Washed', 
                                country: 'Peru', roast: 'light', 
                                description: 'Varietal: Caturra', roaster_id: 1)}

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:roaster_id) }
    it { should validate_presence_of(:method) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:roast) }
  end

  describe "Associations" do
    it { should have_many(:recipes) }
    it { should belong_to(:roaster) }
  end
end
