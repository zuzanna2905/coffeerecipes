require 'rails_helper'

RSpec.describe Roaster, type: :model do
  subject { build :roaster }

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:country) }
  end

  describe "Associations" do
    it { should have_many(:recipes) }
    it { should have_many(:beans) }
  end
end
