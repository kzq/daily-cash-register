# frozen_string_literal: true

require "rails_helper"
# require 'controllers/shared_examples/index_examples.rb'

RSpec.describe NotificationsController, type: :controller do
  describe "guest access" do
    include_examples "guest access"
  end

  describe "user access" do
    login_user

    describe "GET index" do
      before :each do
        get :index
      end

      include_examples "request response examples", :index

      it "populates an array of all notifications" do
        welcome = create(:notification, title: "Welcome", body: "Your profile is approved")
        offers = create(:notification, title: "Offers", body: "Here are our lates offers")
        expect(assigns(:notifications)).to match_array([welcome, offers])
      end
    end

    describe "GET new" do
      before :each do
        get :new
      end

      include_examples "request response examples", :new

      it "assigns new Notification to @notification" do
        expect(assigns(:notification)).to be_a_new(Notification)
      end
    end

    describe "GET edit" do
      let(:notification) { create(:notification) }

      before :each do
        get :edit, params: { id: notification }
      end

      include_examples "request response examples", :edit

      it "assigns the requested notification to @notification" do
        expect(assigns(:notification)).to eq notification
      end
    end

    describe "POST create" do
      context "with valid attributes" do
        let(:notification) { attributes_for(:notification) }

        it "saves the new notification in the database" do
          notification
          expect {
            post :create, params: { notification: notification }
          }.to change(Notification, :count).by(1)
        end

        it "redirects to notifications#show" do
          post :create, params: { notification: notification }
          expect(response).to redirect_to notifications_url
        end
      end

      context "with invalid attributes" do
        it "does not save the new notification in the database" do
          expect {
            post :create, params: { notification: attributes_for(:invalid_notification) }
          }.to_not change(Notification, :count)
        end

        it "re-renders the :new template" do
          post :create, params: { notification: attributes_for(:invalid_notification) }
          expect(response).to render_template :new
        end
      end
    end

    describe "PUT update" do
      let(:notification) { create(:notification) }

      context "with valid attributes" do
        it "locates the requested @notification" do
          put :update, params: { id: notification, notification: attributes_for(:notification) }
          expect(assigns(:notification)).to eq notification
        end

        it "changes notification's attributes" do
          put :update, params: { id: notification, notification: attributes_for(:notification, title: "New title", body: "New body") }
          notification.reload
          expect(notification.title).to eq("New title")
          expect(notification.body).to eq("New body")
        end

        it "redirects to the updated notification" do
          put :update, params: { id: notification, notification: attributes_for(:notification) }
          expect(response).to redirect_to notification
        end
      end

      context "with invalid attributes" do
        it "does not change the notification's attributes" do
          put :update, params: { id: notification, notification: attributes_for(:notification, title: "New title") }
          expect(notification.title).to eq("You have new job offer")
          expect(notification.body).to eq("Student ambassador at Kingston University. Sat 11:00 - 13:30Student ambassador at Kingston University. Sat 11:00 - 13:30Student ambassador at Kingston University. Sat 11:00 - 13:30")
        end

        it "re-renders the edit template" do
          put :update, params: { id: notification, notification: attributes_for(:invalid_notification) }
          expect(response).to render_template :edit
        end
      end
    end

    describe "DELETE destroy" do
      let(:notification) { create(:notification) }

      it "deletes the notifications" do
        notification
        expect {
          delete :destroy, params: { id: notification }
        }.to change(Notification, :count).by(-1)
      end

      it "redirects to notifications#index" do
        delete :destroy, params: { id: notification }
        expect(response).to redirect_to notifications_url
      end

      it "returns http success" do
        delete :destroy, params: { id: notification }
        expect(response).to redirect_to notifications_url
      end
    end
  end
end
