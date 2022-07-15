require 'rails_helper'

RSpec.describe User, type: :model do
  it "it validates factory" do
    expect(build(:user)).to be_valid
  end

  it { should belong_to(:role) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:password_confirmation) }

  describe "when username is not present" do
    before { @user = User.new(username: "") }
    it { expect(@user).not_to be_valid }
  end

  describe "when email is not present" do
    before { @user = User.new(email: "") }
    it { expect(@user).not_to be_valid }
  end

  describe "when password is not present" do
    before { @user = User.new(password: "") }
    it { expect(@user).not_to be_valid }
  end

  describe "when password_confirmation is not present" do
    before { @user = User.new(password_confirmation: "") }
    it { expect(@user).not_to be_valid }
  end

  describe "when the role is not present" do
    before { @user = User.new(role_id: "") }
    it { expect(@user).not_to be_valid }
  end
end
