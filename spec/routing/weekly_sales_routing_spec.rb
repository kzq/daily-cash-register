require "rails_helper"

RSpec.describe WeeklySalesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/weekly_sales").to route_to("weekly_sales#index")
    end

    it "routes to #new" do
      expect(:get => "/weekly_sales/new").to route_to("weekly_sales#new")
    end

    it "routes to #show" do
      expect(:get => "/weekly_sales/1").to route_to("weekly_sales#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/weekly_sales/1/edit").to route_to("weekly_sales#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/weekly_sales").to route_to("weekly_sales#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/weekly_sales/1").to route_to("weekly_sales#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/weekly_sales/1").to route_to("weekly_sales#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/weekly_sales/1").to route_to("weekly_sales#destroy", :id => "1")
    end

  end
end
