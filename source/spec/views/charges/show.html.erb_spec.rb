require 'rails_helper'

RSpec.describe "charges/show", :type => :view do
  before(:each) do
    @charge = assign(:charge, Charge.create!(
      :amount => "9.99",
      :unique_code => "Unique Code",
      :paid => false,
      :refunded => false,
      :customer_type => "Owner Type",
      :customer_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Unique Code/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Owner Type/)
    expect(rendered).to match(/1/)
  end
end
