require 'rails_helper'

describe ListPolicy do

  subject { ListPolicy.new(user, record) }
  let(:record) { build(:list) }

  context "for a visitor" do
    let(:user) { nil }

    it { should_not permit(:show) }
    it { should_not permit(:create) }
    it { should_not permit(:new) }
    it { should_not permit(:update) }
    it { should_not permit(:edit) }
  end

  context "for a user" do
    let(:user) { build(:user) }

    it { should permit(:create) }
    it { should permit(:new) }
  end

  context "when record is owned by the user" do
    let(:record) { build(:list) }
    let(:user) { build_stubbed :user }

    it { should permit(:show) }
    it { should permit(:update) }
    it { should permit(:edit) }
  end
end