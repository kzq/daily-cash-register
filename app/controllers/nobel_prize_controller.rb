class NobelPrizeController < ApplicationController
  def index
    data = [{ value: "15", label: "Math"}, { value: "12", label: "Computing"},{ value: "12", label: "Physics"}]
    @dashboard_cards = DashboardCard.create(data)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dashboard_cards, status: :ok }
    end
  end
end
