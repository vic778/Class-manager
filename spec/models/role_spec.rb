require 'rails_helper'

RSpec.describe Role, type: :model do
  it "it validates factory" do
    expect(build(:role)).to be_valid
  end

  it { should have_many(:users) }
  it {is_expected.to validate_presence_of(:name)}
end
