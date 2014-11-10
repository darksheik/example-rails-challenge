require 'rails_helper'

RSpec.describe "companies/show", :type => :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "Name",
      :zip_code => "Zip Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Zip Code/)
  end
end
