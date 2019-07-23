require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }
  
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive}
    it { should have_secure_password }
  end
  
  describe "Associations" do
    it { should have_many(:recipes) }
    it { should have_many(:favorites) }
  end

end