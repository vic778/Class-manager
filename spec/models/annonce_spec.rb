require 'rails_helper'

RSpec.describe Annonce, type: :model do
  it "it validates factory" do
    expect(build(:annonce)).to be_valid
  end

  it { is_expected.to validate_presence_of(:message) }

  describe "when message is not present" do
    before { @annonce = Annonce.new(message: "") }
    it { expect(@annonce).not_to be_valid }
  end
end
