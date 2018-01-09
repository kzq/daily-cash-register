# frozen_string_literal: true

class HomePageController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
  end
end
