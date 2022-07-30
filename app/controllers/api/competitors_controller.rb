class Api::CompetitorsController < ApplicationController
  before_action -> { @business = Business.find_by(id: params[:business_id]).presence || Business.last }
  before_action :set_competitor, only: %i[ show edit update destroy ]

  def index
    @competitors = Competitor.where(business: @business)
  end

  def show
  end

  def new
    @competitor = Competitor.new(business: @business)
  end

  def edit
  end

  def create
    @competitor = Competitor.new(competitor_params)

    respond_to do |format|
      if @competitor.save
        format.html { redirect_to api_competitor_url(@competitor), notice: "Competitor was successfully created." }
        format.json { render :show, status: :created, location: @competitor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @competitor.update(competitor_params)
        format.html { redirect_to api_competitor_url(@competitor), notice: "Competitor was successfully updated." }
        format.json { render :show, status: :ok, location: @competitor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @competitor.destroy

    respond_to do |format|
      format.html { redirect_to api_competitors_url, notice: "Competitor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_competitor
      @competitor = Competitor.find(params[:id])
    end

    def competitor_params
      params.permit(:business_id, :name, :picture, :logo, site_attributes: [:url])
    end
end
