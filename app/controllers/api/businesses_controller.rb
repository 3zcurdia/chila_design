# frozen_string_literal: true

module Api
  class BusinessesController < ApplicationController
    before_action :set_business, only: %i[show edit update destroy]

    def index
      @businesses = Business.all
    end

    def show; end

    def new
      @business = Business.new
    end

    def edit; end

    def create
      @business = business_params.any? ? Business.new(business_params) : Business.autogenerate

      respond_to do |format|
        if @business.save
          format.html { redirect_to api_business_url(@business), notice: "Business was successfully created." }
          format.json { render :show, status: :created, location: @business }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @business.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @business.update(business_params)
          format.html { redirect_to api_business_url(@business), notice: "Business was successfully updated." }
          format.json { render :show, status: :ok, location: @business }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @business.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @business.destroy

      respond_to do |format|
        format.html { redirect_to api_businesses_url, notice: "Business was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def set_business
      @business = Business.find(params[:id])
    end

    def business_params
      params.permit(:name)
    end
  end
end
