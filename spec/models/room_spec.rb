require 'rails_helper'

RSpec.describe Room, type: :model do
  it "it validates factory" do
    expect(build(:room)).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:field) }

  describe "when name is not present" do
    before { @room = Room.new(name: "") }
    it { expect(@room).not_to be_valid }
  end

  describe "when field is not present" do
    before { @room = Room.new(field: "") }
    it { expect(@room).not_to be_valid }
  end

  describe "when name is unique" do
    before { @room = Room.create(name: "room1", field: "ww") }
    it { expect(@room).to be_valid }
  end

  describe "when name is not unique" do
    before { @room = Room.create(name: "room1", field: "ww") }
    before { @room2 = Room.new(name: "room1", field: "ww") }
    it { expect(@room2).not_to be_valid }
  end
  
end
