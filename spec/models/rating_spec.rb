require 'rails_helper'

RSpec.describe Rating, type: :model do
  context "Testing factory" do
    it { expect(build(:rating)).to be_valid }
  end

  context "Validating comment" do
    it " should be invalid if empty" do
      expect(build(:rating, comment: "")).to be_invalid
    end
  end

end
