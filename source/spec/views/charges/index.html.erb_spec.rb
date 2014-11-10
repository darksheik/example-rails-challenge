require 'rails_helper'

RSpec.describe "charges/index", :type => :view do
  before(:each) do
    assign(:charges, [
      Charge.create!(
        :amount => "9.99",
        :unique_code => "Unique Code",
        :paid => false,
        :refunded => false,
        :owner_type => "Owner Type",
        :owner_id => 1
      ),
      Charge.create!(
        :amount => "9.99",
        :unique_code => "Unique Code",
        :paid => false,
        :refunded => false,
        :owner_type => "Owner Type",
        :owner_id => 1
      )
    ])
  end

  it "renders a list of charges" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Unique Code".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Owner Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
