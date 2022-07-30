class Api::DimensionsController < ApplicationController
  before_action -> { @business = Business.find_by(id: params[:business_id]).presence || Business.last }
  before_action -> { params.merge(dimensionable_type: "Business", dimensionable_id: params[:business_id].presence || Business.last.id) }
  before_action :set_dimension, only: %i[ show edit update destroy ]

  def index
    @dimensions = Dimension.where(dimensionable: @business)
  end

  def show
  end

  def new
    @dimension = Dimension.new(dimensionable: @business)
  end

  def edit
  end

  def create
    @dimension = Dimension.new(dimension_params)

    respond_to do |format|
      if @dimension.save
        format.html { redirect_to api_dimension_url(@dimension), notice: "Dimension was successfully created." }
        format.json { render :show, status: :created, location: @dimension }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dimension.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dimension.update(dimension_params)
        format.html { redirect_to api_dimension_url(@dimension), notice: "Dimension was successfully updated." }
        format.json { render :show, status: :ok, location: @dimension }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dimension.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dimension.destroy

    respond_to do |format|
      format.html { redirect_to api_dimensions_url, notice: "Dimension was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_dimension
      @dimension = Dimension.find(params[:id])
    end

    def dimension_params
      params.permit(:dimensionable_type, :dimensionable_id, :quality_id, :value")
    end
end
