require 'rails_helper'

RSpec.describe HomeWork, type: :model do
  it "it validates factory" do
    expect(build(:home_work)).to be_valid
  end

  it {should belong_to(:user)}
  it {should belong_to(:room)}
  it {is_expected.to validate_presence_of(:assignment)}
  it {is_expected.to validate_presence_of(:course_name)}
end
