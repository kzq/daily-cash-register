# frozen_string_literal: true

require "rails_helper"

RSpec.describe NotificationsController, type: :controller do
  describe "guest access" do
    describe "GET index" do
      it "requires login" do
        get :index
        expect(response).to redirect_to new_user_session_url
      end
    end
  end

  describe "user access" do
    login_user

    describe "GET index" do
      it "renders :index template" do
        get :index
        expect(response).to render_template(:index)
      end

      it "populates an array of all notifications" do
        welcome = create(:notification, title: "Welcome", body: "Your profile is approved")
        offers = create(:notification, title: "Offers", body: "Here are our lates offers")
        get :index
        expect(assigns(:notifications)).to match_array([welcome, offers])
      end

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET new" do
      it "renders :new template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "assigns new Notification to @notification" do
        get :new
        expect(assigns(:notification)).to be_a_new(Notification)
      end
    end

    describe "GET edit" do
      it "renders :edit template" do
        notification = create(:notification)
        get :edit, params: { id: notification }
        expect(response).to render_template(:edit)
      end

      it "returns http success" do
        notification = create(:notification)
        get :edit, params: { id: notification }
        expect(response).to have_http_status(:success)
      end

      it "assigns the requested notification to @notification" do
        notification = create(:notification)
        get :edit, params: { id: notification }
        expect(assigns(:notification)).to eq notification
      end
    end

    describe "POST create" do
      context "with valid attributes" do
        before :each do
          @notification = attributes_for(:notification)
        end

        it "saves the new notification in the database" do
          expect {
            post :create, params: { notification: @notification }
          }.to change(Notification, :count).by(1)
        end

        it "redirects to notifications#show" do
          post :create, params: { notification: @notification }
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

    describe "PATCH update" do
      before :each do
        @notification = create(:notification)
      end

      context "with valid attributes" do
        it "locates the requested @notification" do
          patch :update, params: { id: @notification, notification: attributes_for(:notification) }
          expect(assigns(:notification)).to eq @notification
        end

        it "changes notification's attributes" do
          patch :update, params: { id: @notification, notification: attributes_for(:notification, title: "New title", body: "New body") }
          @notification.reload
          expect(@notification.title).to eq("New title")
          expect(@notification.body).to eq("New body")
        end

        it "redirects to the updated notification" do
          patch :update, params: { id: @notification, notification: attributes_for(:notification) }
          expect(response).to redirect_to @notification
        end
      end

      context "with invalid attributes" do
        it "does not change the notification's attributes" do
          patch :update, params: { id: @notification, notification: attributes_for(:notification, title: "New title") }
          expect(@notification.title).to eq("You have new job offer")
          expect(@notification.body).to eq("Student ambassador at Kingston University. Sat 11:00 - 13:30Student ambassador at Kingston University. Sat 11:00 - 13:30Student ambassador at Kingston University. Sat 11:00 - 13:30")
        end

        it "re-renders the edit template" do
          patch :update, params: { id: @notification, notification: attributes_for(:invalid_notification) }
          expect(response).to render_template :edit
        end
      end
    end

    describe "DELETE destroy" do
      before :each do
        @notification = create(:notification)
      end

      it "deletes the notifications" do
        expect {
          delete :destroy, params: { id: @notification }
        }.to change(Notification, :count).by(-1)
      end

      it "redirects to notifications#index" do
        delete :destroy, params: { id: @notification }
        expect(response).to redirect_to notifications_url
      end

      it "returns http success" do
        notification = create(:notification)
        get :destroy, params: { id: notification }
        expect(response).to redirect_to notifications_url
      end
    end
  end
end
