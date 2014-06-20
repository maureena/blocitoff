require 'rails_helper'

describe Item do

  before :each do
    @item = Item.new :description# more stuff goes here, use factories?
  end

  describe "#new" do
    it "takes one parameter and returns an Item object" do
      expect(@item).to be_an_instance_of(Item)
    end
  end

  describe "#description" do
    it "returns the correct description" do
      expect(@item.description).to eql(:description)
    end
  end

end