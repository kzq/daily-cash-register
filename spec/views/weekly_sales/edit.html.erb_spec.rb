require 'rails_helper'

RSpec.describe "weekly_sales/edit", type: :view do
  before(:each) do
    @weekly_sale = assign(:weekly_sale, WeeklySale.create!(
      :start_date => "MyString",
      :datetime => "MyString",
      :end_date => "MyString",
      :datetime => "MyString",
      :sales => "9.99",
      :rent => "9.99",
      :cost => "9.99",
      :gross_profit => "9.99",
      :net_profit => "9.99"
    ))
  end

  it "renders the edit weekly_sale form" do
    render

    assert_select "form[action=?][method=?]", weekly_sale_path(@weekly_sale), "post" do

      assert_select "input[name=?]", "weekly_sale[start_date]"

      assert_select "input[name=?]", "weekly_sale[datetime]"

      assert_select "input[name=?]", "weekly_sale[end_date]"

      assert_select "input[name=?]", "weekly_sale[datetime]"

      assert_select "input[name=?]", "weekly_sale[sales]"

      assert_select "input[name=?]", "weekly_sale[rent]"

      assert_select "input[name=?]", "weekly_sale[cost]"

      assert_select "input[name=?]", "weekly_sale[gross_profit]"

      assert_select "input[name=?]", "weekly_sale[net_profit]"
    end
  end
end
