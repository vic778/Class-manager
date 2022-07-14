require 'rails_helper'

RSpec.describe User, type: :model do
  it "it validates factory" do
    expect(build(:user)).to be_valid
  end

  it { should belong_to(:role) }
  it {is_expected.to validate_presence_of(:username)}
  it {is_expected.to validate_presence_of(:email)}
  it {is_expected.to validate_presence_of(:password)}
  it {is_expected.to validate_presence_of(:password_confirmation)}
end
