# frozen_string_literal: true

module Backoffice
  class DimensionsController < ApplicationController
    before_action :set_dimensionale
    before_action :set_dimension, only: %i[show edit update destroy]

    def index
      @dimensions = Dimension.includes(:quality).where(dimensionable: @dimensionable)
    end

    def show; end

    def new
      @dimension = Dimension.new(dimensionable: @dimensionable)
    end

    def edit; end

    def create
      @dimension = Dimension.new(dimension_params)
      @dimension.dimensionable = @dimensionable

      respond_to do |format|
        if @dimension.save
          format.html do
            redirect_to backoffice_dimension_url(@dimension), notice: "Dimension was successfully created."
          end
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
          format.html do
            redirect_to backoffice_dimension_url(@dimension), notice: "Dimension was successfully updated."
          end
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
        format.html { redirect_to backoffice_dimensions_url, notice: "Dimension was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def set_dimension
      @dimension = Dimension.find(params[:id])
    end

    def dimension_params
      params.require(:dimension).permit(:quality_id, :value)
    end

    def set_dimensionale
      @dimensionable = Asset.find(params[:dimensionable_id]) if params[:dimensionable_id].present?
    end
  end
end
