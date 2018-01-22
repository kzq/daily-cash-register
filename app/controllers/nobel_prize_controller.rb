class NobelPrizeController < ApplicationController
  def index
    @dashboard_cards = DashboardCard.create([{ value: "15", label: "Math"}, { value: "12", label: "Computing"},{ value: "12", label: "Physics"}])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dashboard_cards, status: :ok }
    end
  end
end
