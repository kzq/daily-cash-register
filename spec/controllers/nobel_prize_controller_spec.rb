require 'rails_helper'

RSpec.describe NobelPrizeController, type: :controller do
  describe "guest access" do
    include_examples "guest access"
  end

  describe "user access" do
    login_user

    describe "GET #index" do
      before :each do
        get :index
      end

      include_examples "request response examples", :index

      it "populates nobel_prizes to @nodel_prizes"
    end
  end
end
