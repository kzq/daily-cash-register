# frozen_string_literal: true

require "rails_helper"

RSpec.describe WeeklySalesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # WeeklySale. As you add validations to WeeklySale, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:weekly_sale)
  }

  let(:invalid_attributes) {
    attributes_for(:invalid_weekly_sale)
  }

  let(:weekly_sale) { create(:weekly_sale) }

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

      it "populates array of all weekly sales" do
        moday_sale = create(:weekly_sale, net_profit: 500)
        sunday_sale = create(:weekly_sale, net_profit: 100)
        expect(assigns(:weekly_sales)).to match_array([moday_sale, sunday_sale])
      end
    end

    describe "GET #show" do
      before :each do
        get :show, params: { id: weekly_sale }
      end

      include_examples "request response examples", :show
    end

    describe "GET #new" do
      before :each do
        get :new
      end

      include_examples "request response examples", :new

      it { expect(assigns(:weekly_sale)).to be_a_new(WeeklySale) }
    end

    describe "GET #edit" do
      before :each do
        get :edit, params: { id: weekly_sale }
      end

      include_examples "request response examples", :edit

      it { expect(assigns(:weekly_sale)).to eq(weekly_sale) }
    end

    describe "POST #create" do
      context "with valid params" do
        it "saves the new weekly sale to database" do
          expect {
            post :create, params: { weekly_sale: valid_attributes }
          }.to change(WeeklySale, :count).by(1)
        end

        it "redirects to the weekly_sales#index" do
          post :create, params: { weekly_sale: valid_attributes }
          expect(response).to redirect_to(weekly_sales_url)
        end
      end

      context "with invalid params" do
        it "does not save the new weekly_sale in the database" do
          expect {
            post :create, params: { weekly_sale: invalid_attributes }
          }.to_not change(WeeklySale, :count)
        end

        it "re-renders the :new template" do
          post :create, params: { weekly_sale: invalid_attributes }
          expect(response).to render_template :new
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:weekly_sale) { create(:weekly_sale, net_profit: 500) }

        before :each do
          put :update, params: { id: weekly_sale, weekly_sale: attributes_for(:weekly_sale, net_profit: 2500, gross_profit: 500) }
        end

        it { expect(assigns(:weekly_sale)).to eq weekly_sale }

        it "updates the requested weekly sale attributes" do
          weekly_sale.reload
          expect(weekly_sale).to have_attributes(net_profit: 2500, gross_profit: 500)
        end

        it { expect(response).to redirect_to weekly_sale_url }

        it { is_expected.to redirect_to weekly_sale_url }
      end

      context "with invalid params" do
        let(:weekly_sale) { create(:weekly_sale, net_profit: 500) }

        before :each do
          put :update, params: { id: weekly_sale, weekly_sale: attributes_for(:invalid_weekly_sale) }
        end

        it "does not change the attributes" do
          expect(weekly_sale).to have_attributes(net_profit: 500)
        end

        it "re-renders the edit template" do
          expect(response).to render_template :edit
        end
      end
    end

    describe "DELETE #destroy" do
      let(:weekly_sale) { create(:weekly_sale) }

      it "deletes the weekly_sale" do
        weekly_sale
        expect {
          delete :destroy, params: { id: weekly_sale }
        }.to change(WeeklySale, :count).by(-1)
      end

      it "redirects to weekly_sales#index" do
        delete :destroy, params: { id: weekly_sale }
        expect(response).to redirect_to weekly_sales_url
      end

      it "returns http success" do
        delete :destroy, params: { id: weekly_sale }
        expect(response).to redirect_to weekly_sales_url
      end
    end
  end
end
