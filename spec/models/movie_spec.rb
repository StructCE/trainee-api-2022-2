require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "Testing factory" do
    it { expect(build(:movie)).to be_valid }
  end

  context "Validating name" do
    it " should be invalid if nil" do
      expect(build(:movie, name: nil)).to be_invalid
    end

    it " should be invalid if repeated" do
      create(:movie, name: "Deadpool")
      expect(build(:movie, name: "Deadpool")).to be_invalid
    end
  end

  context "Validating genre" do
    it " should be invalid if nil" do
      expect(build(:movie, genre: nil)).to be_invalid
    end

    it " should be invalid if doesn't exist" do
      create(:movie, name: "Deadpool")
      expect(build(:movie, name: "Deadpool")).to be_invalid
    end
  end
end
