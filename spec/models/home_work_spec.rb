require 'rails_helper'

RSpec.describe HomeWork, type: :model do
  it "it validates factory" do
    expect(build(:home_work)).to be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:room) }
  it { is_expected.to validate_presence_of(:assignment) }
  it { is_expected.to validate_presence_of(:course_name) }

  describe "when user_id is not present" do
    before { @home_work = HomeWork.new(user_id: "") }
    it { expect(@home_work).not_to be_valid }
  end

  describe "when room_id is not present" do
    before { @home_work = HomeWork.new(room_id: "") }
    it { expect(@home_work).not_to be_valid }
  end

  describe "when assignment is not present" do
    before { @home_work = HomeWork.new(assignment: "") }
    it { expect(@home_work).not_to be_valid }
  end

  describe "when course_name is not present" do
    before { @home_work = HomeWork.new(course_name: "") }
    it { expect(@home_work).not_to be_valid }
  end

end
