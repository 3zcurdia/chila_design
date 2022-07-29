# frozen_string_literal: true

module Backoffice
  class FontsController < ApplicationController
    before_action :set_font, only: %i[show edit update destroy]

    def index
      @fonts = Font.all
    end

    def show; end

    def new
      @font = Font.new
    end

    def edit; end

    def create
      @font = Font.new(font_params)

      respond_to do |format|
        if @font.save
          format.html { redirect_to backoffice_font_url(@font), notice: "Font was successfully created." }
          format.json { render :show, status: :created, location: @font }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @font.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @font.update(font_params)
          format.html { redirect_to backoffice_font_url(@font), notice: "Font was successfully updated." }
          format.json { render :show, status: :ok, location: @font }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @font.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @font.destroy

      respond_to do |format|
        format.html { redirect_to backoffice_fonts_url, notice: "Font was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def set_font
      @font = Font.find(params[:id])
    end

    def font_params
      params.require(:font).permit(:name, :value)
    end
  end
end
