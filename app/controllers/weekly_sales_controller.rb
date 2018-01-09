# frozen_string_literal: true

class WeeklySalesController < ApplicationController
  before_action :set_weekly_sale, only: %i[show edit update destroy]

  # GET /weekly_sales
  # GET /weekly_sales.json
  def index
    @weekly_sales = WeeklySale.all
  end

  # GET /weekly_sales/1
  # GET /weekly_sales/1.json
  def show
  end

  # GET /weekly_sales/new
  def new
    @weekly_sale = WeeklySale.new
  end

  # GET /weekly_sales/1/edit
  def edit
  end

  # POST /weekly_sales
  # POST /weekly_sales.json
  def create
    @weekly_sale = WeeklySale.new(weekly_sale_params)
    daily_sale_sheets = params[:weekly_sale][:daily_sale_sheets]
    respond_to do |format|
      if @weekly_sale.save
        if daily_sale_sheets
          @weekly_sale.daily_sale_sheets.attach(daily_sale_sheets)
        end
        format.html { redirect_to weekly_sales_path, notice: "Weekly sale was successfully created." }
        format.json { render :show, status: :created, location: @weekly_sale }
      else
        format.html { render :new }
        format.json { render json: @weekly_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekly_sales/1
  # PATCH/PUT /weekly_sales/1.json
  def update
    respond_to do |format|
      if @weekly_sale.update(weekly_sale_params)
        format.html { redirect_to @weekly_sale, notice: "Weekly sale was successfully updated." }
        format.json { render :show, status: :ok, location: @weekly_sale }
      else
        format.html { render :edit }
        format.json { render json: @weekly_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_sales/1
  # DELETE /weekly_sales/1.json
  def destroy
    @weekly_sale.destroy
    respond_to do |format|
      format.html { redirect_to weekly_sales_url, notice: "Weekly sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly_sale
      @weekly_sale = WeeklySale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weekly_sale_params
      params.fetch(:weekly_sale, {}).permit(:start_date, :end_date, :sale, :rent, :cost, :gross_profit, :net_profit, :daily_sale_sheets)
    end

    def daily_sale_sheet_params
      params.dig(:weekly_sale, :daily_sale_sheets)
  end
end
