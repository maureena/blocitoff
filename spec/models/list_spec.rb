require 'rails_helper'

describe List do

    it "has a valid factory" do
    expect(build(:list)).to be_valid
  end

end