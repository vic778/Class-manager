require 'rails_helper'

RSpec.describe Role, type: :model do
  it "it validates factory" do
    expect(build(:role)).to be_valid
  end

  it { should have_many(:users) }
  it { is_expected.to validate_presence_of(:name) }

  describe "when name is not present" do
    before { @role = Role.new(name: "") }
    it { expect(@role).not_to be_valid }
  end

  describe "when name is unique" do
    before { @role = Role.create(name: "student") }
    it { expect(@role).to be_valid }
  end
end
