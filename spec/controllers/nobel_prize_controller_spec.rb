require 'rails_helper'

RSpec.describe NobelPrizeController, type: :controller do
  describe "guest access" do
    include_examples "guest access"
  end

  describe "user access" do
    login_user

    describe "GET #index" do
      let(:data) { [{:label=>"physics", :value=>111}, {:label=>"literature", :value=>110}] }
      let(:data_collector) { double("NobelPrizeDataCollector", collect: "data_collection") }
      let(:teller) { double("NobelPrizeTeller", total_prizes_per_subject: data) }
      let(:card_1) { double("DashboardCard", label: "physics", value: "111") }
      let(:card_2) { double("DashboardCard", label: "literature", value: "110") }
      let(:dashboard_cards) { [ card_1,card_2 ] }

      before :each do
        # mock class methods
        allow(NobelPrizeDataCollector).to receive(:new).and_return(data_collector)
        allow(NobelPrizeTeller).to receive(:new).with(data_collector.collect).and_return(teller)
        allow(DashboardCard).to receive(:create).and_return(dashboard_cards)
      end

      before :each do |example|
        unless example.metadata[:skip_before]
          get :index
        end
      end

      include_examples "request response examples", :index


      it "populates array of all dashboard cards", :skip_before do
        get :index
        expect(assigns(:dashboard_cards)).to match_array(dashboard_cards)
      end
    end
  end
end