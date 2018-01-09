# frozen_string_literal: true

require "rails_helper"

RSpec.describe "weekly_sales/show", type: :view do
  before(:each) do
    @weekly_sale = assign(:weekly_sale, WeeklySale.create!(
                                          start_date: "Start Date",
                                          datetime: "Datetime",
                                          end_date: "End Date",
                                          datetime: "Datetime",
                                          sales: "9.99",
                                          rent: "9.99",
                                          cost: "9.99",
                                          gross_profit: "9.99",
                                          net_profit: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Start Date/)
    expect(rendered).to match(/Datetime/)
    expect(rendered).to match(/End Date/)
    expect(rendered).to match(/Datetime/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
