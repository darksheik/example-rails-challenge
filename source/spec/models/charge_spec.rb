require 'rails_helper'

RSpec.describe Charge, :type => :model do
  context "associations" do
    it { should belong_to(:customer) }
  end

  context "scopes" do
    describe "Successful charge" do
      before {
        Charge.create!(:paid => true, :refunded => false) #successful
        Charge.create!(:paid => true, :refunded => true)  #disputed
        Charge.create!(:paid => false)                    #failed
      }

      it "should return 1 successful charge" do
        expect(Charge.successful.count).to eq(1)
      end

      it "should return 1 disputed charge" do
        expect(Charge.disputed.count).to eq(1)
      end

      it "should return 1 failed charge" do
        expect(Charge.failed.count).to eq(1)
      end
    end
  end
end
