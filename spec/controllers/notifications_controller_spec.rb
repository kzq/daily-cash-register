# frozen_string_literal: true

require "rails_helper"

RSpec.describe NotificationsController, type: :controller do
  login_user

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(subject).to render_template("index")
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      notification = create(:notification)
      get :edit, params: { id: notification }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create, params: { notification: attributes_for(:notification) }
      expect(response).to redirect_to notifications_path
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      notification = create(:notification)
      get :destroy, params: { id: notification }
      expect(response).to redirect_to notifications_path
    end
  end

end
