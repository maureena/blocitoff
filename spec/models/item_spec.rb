require 'rails_helper'

describe Item do

  it "has a valid factory" do
    expect(build(:item)).to be_valid
  end

  describe "#days_left" do
    it "returns number of days left on item" do
      item = create(:item)
      expect(item.days_left).to eq(2)
    end
  end
end