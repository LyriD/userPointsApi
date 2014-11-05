require 'rails_helper'

describe Api::UsersController, type: :controller do
  describe "change_rate" do
    let!(:user) { FactoryGirl.create(:user) }

    context "post increase by 50" do
      subject { post :change_rate, increase: 50, id: user.id }

      it { expect{subject}.to change { user.transactions.count }.by(1) }

      before { user.decrease = 50 }
      it { expect(user.transactions.last.sum).to eq (-50) }
    end

    context "post decrease by 50" do
      subject { post :change_rate, decrease: 50, id: user.id }

      before { user.decrease = 50 }
      it { expect(user.transactions.last.sum).to eq (-50) }
    end
  end
end
