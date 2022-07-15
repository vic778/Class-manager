require 'rails_helper'

RSpec.describe ClassRoom, type: :model do
  it "it validates factory" do
    expect(build(:class_room)).to be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:room) }

  describe "when user_id is not present" do
    before { @class_room = ClassRoom.new(user_id: "") }
    it { expect(@class_room).not_to be_valid }
  end

  describe "when room_id is not present" do
    before { @class_room = ClassRoom.new(room_id: "") }
    it { expect(@class_room).not_to be_valid }
  end
end
