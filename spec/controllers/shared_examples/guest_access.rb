# frozen_string_literal: true

RSpec.shared_examples "guest access" do
  describe "GET index" do
    it "requires login" do
      get :index
      expect(response).to redirect_to new_user_session_url
    end
  end
end
