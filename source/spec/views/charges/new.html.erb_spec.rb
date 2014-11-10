require 'rails_helper'

RSpec.describe "charges/new", :type => :view do
  before(:each) do
    assign(:charge, Charge.new(
      :amount => "9.99",
      :unique_code => "MyString",
      :paid => false,
      :refunded => false,
      :owner_type => "MyString",
      :owner_id => 1
    ))
  end

  it "renders new charge form" do
    render

    assert_select "form[action=?][method=?]", charges_path, "post" do

      assert_select "input#charge_amount[name=?]", "charge[amount]"

      assert_select "input#charge_unique_code[name=?]", "charge[unique_code]"

      assert_select "input#charge_paid[name=?]", "charge[paid]"

      assert_select "input#charge_refunded[name=?]", "charge[refunded]"

      assert_select "input#charge_owner_type[name=?]", "charge[owner_type]"

      assert_select "input#charge_owner_id[name=?]", "charge[owner_id]"
    end
  end
end