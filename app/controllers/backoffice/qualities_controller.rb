# frozen_string_literal: true

module Backoffice
  class QualitiesController < ApplicationController
    before_action :set_quality, only: %i[show edit update destroy]

    def index
      @qualities = Quality.all
    end

    def show; end

    def new
      @quality = Quality.new
    end

    def edit; end

    def create
      @quality = Quality.new(quality_params)

      respond_to do |format|
        if @quality.save
          format.html { redirect_to backoffice_quality_url(@quality), notice: "Quality was successfully created." }
          format.json { render :show, status: :created, location: @quality }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @quality.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @quality.update(quality_params)
          format.html { redirect_to backoffice_quality_url(@quality), notice: "Quality was successfully updated." }
          format.json { render :show, status: :ok, location: @quality }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @quality.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @quality.destroy

      respond_to do |format|
        format.html { redirect_to backoffice_qualities_url, notice: "Quality was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def set_quality
      @quality = Quality.find(params[:id])
    end

    def quality_params
      params.require(:quality).permit(:name, :antithesis, :thesis)
    end
  end
end
