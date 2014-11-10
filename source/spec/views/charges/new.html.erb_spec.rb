require 'rails_helper'

RSpec.describe "charges/new", :type => :view do
  before(:each) do
    assign(:charge, Charge.new(
      :amount => "9.99",
      :unique_code => "MyString",
      :paid => false,
      :refunded => false,
      :customer_type => "MyString",
      :customer_id => 1
    ))
  end

  it "renders new charge form" do
    render

    assert_select "form[action=?][method=?]", charges_path, "post" do

      assert_select "input#charge_amount[name=?]", "charge[amount]"

      assert_select "input#charge_unique_code[name=?]", "charge[unique_code]"

      assert_select "input#charge_paid[name=?]", "charge[paid]"

      assert_select "input#charge_refunded[name=?]", "charge[refunded]"

      assert_select "input#charge_customer_type[name=?]", "charge[customer_type]"

      assert_select "input#charge_customer_id[name=?]", "charge[customer_id]"
    end
  end
end
