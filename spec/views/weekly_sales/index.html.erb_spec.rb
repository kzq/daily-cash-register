require 'rails_helper'

RSpec.describe "weekly_sales/index", type: :view do
  before(:each) do
    assign(:weekly_sales, [
      WeeklySale.create!(
        :start_date => "Start Date",
        :datetime => "Datetime",
        :end_date => "End Date",
        :datetime => "Datetime",
        :sales => "9.99",
        :rent => "9.99",
        :cost => "9.99",
        :gross_profit => "9.99",
        :net_profit => "9.99"
      ),
      WeeklySale.create!(
        :start_date => "Start Date",
        :datetime => "Datetime",
        :end_date => "End Date",
        :datetime => "Datetime",
        :sales => "9.99",
        :rent => "9.99",
        :cost => "9.99",
        :gross_profit => "9.99",
        :net_profit => "9.99"
      )
    ])
  end

  it "renders a list of weekly_sales" do
    render
    assert_select "tr>td", :text => "Start Date".to_s, :count => 2
    assert_select "tr>td", :text => "Datetime".to_s, :count => 2
    assert_select "tr>td", :text => "End Date".to_s, :count => 2
    assert_select "tr>td", :text => "Datetime".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
