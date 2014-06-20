require 'rails_helper'

describe List do

  before :each do
    @list = List.new # more stuff goes here, use factories?
    @item = Item.new :description
  end

  describe "#new" do
    context "with no parameters" do
      it "has no items" do
        expect(@list).to be_empty
      end
    end
  end

  describe "#show" do
    it "returns an Item object from the list" do
      @item = @list.items.build(:description)
        expect(@list.item).to be_an_instance_of(Item)
    end
  end

end