require 'rails_helper'

RSpec.describe Room, type: :model do
  it "it validates factory" do
    expect(build(:room)).to be_valid
  end

  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:field)}
end

