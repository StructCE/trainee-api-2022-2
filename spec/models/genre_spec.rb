require 'rails_helper'

RSpec.describe Genre, type: :model do
  context "Testing factory" do
    it { expect(build(:genre)).to be_valid }
  end

  context "Validating name" do
    it " should be invalid if nil" do
      expect(build(:genre, name: nil)).to be_invalid
    end

    it " should be invalid if repeated" do
      create(:genre, name: "Terror")
      expect(build(:genre, name: "Terror")).to be_invalid
    end
  end
end
