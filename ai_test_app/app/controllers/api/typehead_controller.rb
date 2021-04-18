module Api
  class TypeheadController < ApplicationController

    def search
      users = User.where("lower(email) LIKE ? OR lower(last_name) LIKE ? OR lower(first_name) LIKE ?", "%#{params[:input].downcase}%","%#{params[:input].downcase}%","%#{params[:input].downcase}%")
      render json: {users: {data: users}}, status: :ok
    end

  end
end