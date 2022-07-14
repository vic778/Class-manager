require 'rails_helper'

RSpec.describe StudentUp, type: :model do
  it "it validates factory" do
    expect(build(:student_up)).to be_valid
  end

  it {should belong_to(:user)}
  it {should belong_to(:room)}
  it {should belong_to(:home_work)}
  it {is_expected.to validate_presence_of(:assignment)}
end
