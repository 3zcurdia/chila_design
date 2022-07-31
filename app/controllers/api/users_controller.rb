# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    before_action -> { @business = Business.find_by(id: params[:business_id]).presence || Business.last }
    before_action :set_user, only: %i[show edit update destroy]

    def index
      @users = User.all
    end

    def show; end

    def new
      @user = User.new
    end

    def edit; end

    def create
      respond_to do |format|
        if @user = User.create_passwordless(user_params)
          @business.update(user: @user)
          format.html { redirect_to api_user_url(@user), notice: "User was successfully created." }
          format.json { render :show, status: :created }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to api_user_url(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.destroy

      respond_to do |format|
        format.html { redirect_to api_users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:email)
    end
  end
end
