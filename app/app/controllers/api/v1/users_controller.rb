module Api
  module V1
    class UsersController < ApplicationController
      # skip_before_action :verify_authenticity_token

      def create
        user = User.new(user_params)
        byebug
        if user.save
          render json: { status: 'User created successfully', data: user }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
