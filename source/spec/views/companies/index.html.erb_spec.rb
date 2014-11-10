require 'rails_helper'

RSpec.describe "companies/index", :type => :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :name => "Name",
        :zip_code => "Zip Code"
      ),
      Company.create!(
        :name => "Name",
        :zip_code => "Zip Code"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
  end
end
