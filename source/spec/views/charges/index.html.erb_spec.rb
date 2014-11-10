require 'rails_helper'

RSpec.describe "charges/index", :type => :view do
  before(:each) do
    assign(:charges, [
      Charge.create!(
        :amount => "9.99",
        :unique_code => "Unique Code",
        :paid => false,
        :refunded => false,
        :customer_type => "Customer Type",
        :customer_id => 1
      ),
      Charge.create!(
        :amount => "9.99",
        :unique_code => "Unique Code",
        :paid => false,
        :refunded => false,
        :customer_type => "Customer Type",
        :customer_id => 1
      )
    ])
  end

  it "renders a list of charges" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Unique Code".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 4
    assert_select "tr>td", :text => "Customer Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
