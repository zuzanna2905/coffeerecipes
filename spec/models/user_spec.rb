require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Jon', email: 'jon@gmail.com', 
                                password: '', password_confirmation: 'jon123')}
  
  describe "Validations" do    
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_uniqueness_of(:email).case_insensitive}
  end
  
  describe "Associations" do
    it { should have_many(:recipes) }
    it { should have_many(:favorites) }
  end

end