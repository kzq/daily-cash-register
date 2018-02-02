# frozen_string_literal: true

class NobelPrizeController < ApplicationController
  def index
    data_collector = NobelPrizeDataCollector.new
    teller = NobelPrizeTeller.new(data_collector.collect)
    data = teller.total_prizes_per_subject
    # data = [{ value: "15", label: "Math"}, { value: "12", label: "Computing"},{ value: "12", label: "Physics"}]
    @dashboard_cards = DashboardCard.create(data)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dashboard_cards, status: :ok }
    end
  end
end
