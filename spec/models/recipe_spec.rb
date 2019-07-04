require 'rails_helper'

RSpec.describe Recipe, type: :model do  
  subject { described_class.new(user_id: 1, bean_id: 1, roaster_id: 1, temperature: 90, 
                                water: 500, dose: 30, method: 'V60', 
                                grinder: 'Comandante', clicks: 15, 
                                time: Time.now, description: 'non', rate: 5, likes: 0)}

  describe "Validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:roaster_id) }
    it { should validate_presence_of(:bean_id) }
    it { should validate_presence_of(:temperature) }
    it { should validate_presence_of(:water) }
    it { should validate_presence_of(:dose) }
    it { should validate_presence_of(:method) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:rate) }
  end

  describe "Associations" do
    it { should have_many(:favorites) }
    it { should belong_to(:roaster) }
    it { should belong_to(:bean) }
    it { should belong_to(:user) }
  end
end