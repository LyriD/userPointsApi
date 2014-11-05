require 'rails_helper'

describe User, :type => :model do

  context "associations" do
    it { is_expected.to have_many(:transactions).dependent(:destroy) }
  end

  context "validations" do
    subject { User.new }
    it { is_expected.to validate_presence_of(:name) }
  end

  context "methods" do
    let(:user) { FactoryGirl.create(:user) }

    describe "#increase by 50" do
      it { expect{ user.increase = 50  }.to change { user.transactions.count }.by(1) }

      before { user.increase = 50 }
      it { expect(user.transactions.last.sum).to eq (50) }
    end

    describe "#decrease by 50" do
      it { expect{ user.decrease = 50 }.to change { user.transactions.count }.by(1) }

      before { user.decrease = 50 }
      it { expect(user.transactions.last.sum).to eq (-50) }
    end
  end
end
