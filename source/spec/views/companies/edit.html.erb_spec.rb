require 'rails_helper'

RSpec.describe "companies/edit", :type => :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "MyString",
      :zip_code => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_zip_code[name=?]", "company[zip_code]"
    end
  end
end
