require 'rails_helper'

RSpec.describe NobelPrizeController, type: :controller do
  describe "guest access" do
    include_examples "guest access"
  end

  describe "user access" do
    login_user

    describe "GET #index" do
      before :each do |example|
        unless example.metadata[:skip_before]
          get :index
        end
      end

      include_examples "request response examples", :index

      it "populates array of all dashboard cards", :skip_before do
        data = [{ value: "15", label: "Math"}, { value: "12", label: "Computing"},{ value: "12", label: "Physics"}]
        dashboard_card = class_double("DashboardCard").as_stubbed_const
        math_card = double("DashboardCard", value: "15", label: "Math")
        computing_card = double("DashboardCard", value: "12", label: "Computing")
        dashboard_cards = [ math_card, computing_card ]
        expect(dashboard_card).to receive(:create).with(data).and_return(dashboard_cards)
        get :index
        expect(assigns(:dashboard_cards)).to match_array(dashboard_cards)
      end
    end
  end
end
