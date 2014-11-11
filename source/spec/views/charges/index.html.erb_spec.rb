require 'rails_helper'

RSpec.describe "charges/index", :type => :view do
  before(:each) do
    User.create!(:first_name => "Johnny", :last_name => "Dangerously")
    Company.create!(:name => "Evil Corporation")

    assign(:failed, [
      Charge.create!(
        :amount => "9.99",
        :unique_code => "Unique Code",
        :paid => false,
        :refunded => false,
        :customer_type => "User",
        :customer_id => 1
      ),
      Charge.create!(
        :amount => "9.99",
        :unique_code => "Unique Code",
        :paid => false,
        :refunded => false,
        :customer_type => "Company",
        :customer_id => 1
      )
    ])
    assign(:disputed, [
      Charge.create!(
        :amount => "9.99",
        :unique_code => "Unique Code",
        :paid => true,
        :refunded => true,
        :customer_type => "User",
        :customer_id => 1
      ),
      Charge.create!(
        :amount => "9.99",
        :unique_code => "Unique Code",
        :paid => true,
        :refunded => true,
        :customer_type => "Company",
        :customer_id => 1
      )
    ])
    assign(:successful, [
      Charge.create!(
        :amount => "9.99",
        :unique_code => "Unique Code",
        :paid => true,
        :refunded => false,
        :customer_type => "User",
        :customer_id => 1
      ),
      Charge.create!(
        :amount => "9.99",
        :unique_code => "Unique Code",
        :paid => true,
        :refunded => false,
        :customer_type => "Company",
        :customer_id => 1
      )
    ])
  end

  it "renders 3 lists" do
    render
    assert_select "table", :count => 3
  end

  it "renders 2 of each kind" do
    render
    assert_select "h1", :text => "Failed charges"
    assert_select "table.failed tr", :count => 3
    assert_select "h1", :text => "Disputed charges"
    assert_select "table.disputed tr", :count => 3
    assert_select "h1", :text => "Successful charges"
    assert_select "table.successful tr", :count => 3
  end
  
end
