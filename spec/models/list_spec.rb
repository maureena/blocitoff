require 'rails_helper'

describe List do

    it "has a valid factory" do
    expect(build(:valid_list)).to be_valid
  end

end