require 'rails_helper'

RSpec.describe ClassRoom, type: :model do
  it "it validates factory" do
    expect(build(:class_room)).to be_valid
  end

  it {should belong_to(:user)}
  it {should belong_to(:room)}
 
end
