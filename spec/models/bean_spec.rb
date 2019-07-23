require 'rails_helper'

RSpec.describe Bean, type: :model do
  subject { build :bean }

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
