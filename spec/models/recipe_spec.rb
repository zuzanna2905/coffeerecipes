require 'rails_helper'

RSpec.describe Recipe, type: :model do  
  subject { build :recipe }

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