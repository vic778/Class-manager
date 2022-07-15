require 'rails_helper'

RSpec.describe StudentUp, type: :model do
  it "it validates factory" do
    expect(build(:student_up)).to be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:room) }
  it { should belong_to(:home_work) }
  it { is_expected.to validate_presence_of(:assignment) }

  describe "when user_id is not present" do
    before { @student_up = StudentUp.new(user_id: "") }
    it { expect(@student_up).not_to be_valid }
  end

  describe "when room_id is not present" do
    before { @student_up = StudentUp.new(room_id: "") }
    it { expect(@student_up).not_to be_valid }
  end

  describe "when home_work_id is not present" do
    before { @student_up = StudentUp.new(home_work_id: "") }
    it { expect(@student_up).not_to be_valid }
  end

  describe "when assignment is not present" do
    before { @student_up = StudentUp.new(assignment: "") }
    it { expect(@student_up).not_to be_valid }
  end
end
