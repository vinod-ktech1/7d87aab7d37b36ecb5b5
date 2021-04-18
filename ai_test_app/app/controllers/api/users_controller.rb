module Api
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_user, only: [:show, :update, :destroy]

    def index
      @users = User.all.order(created_at: :desc).page(params[:page]).per(3)
      render json: @users
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: {data: user, message: "User created successfully"}, status: :created
      else
        render json: user.errors
      end
    end

    def show
      render json: @user
    end
    
    def update
      if @user.update(user_params)
        render json: {data: @user, message: "User record updated successfully."}, status: :ok
      else
        render json: @user.errors
      end
    end

    def destroy
      @user.destroy
      render json: {message: "User record deleted successfully."}, status: :ok
    end

    private
    
      def set_user
        @user = User.find(params[:id])
        render json: {errors: {detail: ["No record found"]}}, status: 404 and return unless @user
      end

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
      end

  end
end