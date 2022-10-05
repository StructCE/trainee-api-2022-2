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

  context "Validating grade" do
    it " should be valid if true" do
      expect(build(:rating, grade: true)).to be_valid
    end

    it " should be valid if false" do
      expect(build(:rating, grade: false)).to be_valid
    end

    it " should be invalid if nil" do
      expect(build(:rating, grade: nil)).to be_invalid
    end
  end

  context "Validating user" do
    it " should be invalid if nil" do
      expect(build(:rating, user: nil)).to be_invalid
    end

    it " should be invalid doesn't exist" do
      expect(build(:rating, user_id: -1)).to be_invalid
    end
  end

  context "Validating movie" do
    it " should be invalid if nil" do
      expect(build(:rating, movie: nil)).to be_invalid
    end

    it " should be invalid if doesn't exist" do
      expect(build(:rating, movie_id: -1)).to be_invalid
    end
  end

  context "Validating uniqueness in scope" do
    it " should be invalid if user already rated movie" do
      user = create(:user)
      movie = create(:movie)
      create(:rating, user: user, movie: movie)
      expect(build(:rating, user: user, movie: movie)).to be_invalid
    end
  end
end
