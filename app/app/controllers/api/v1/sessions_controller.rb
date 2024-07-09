module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json

      # POST /api/v1/sign_in
      def create
        super do |resource|
          if resource.persisted?
            token = generate_jwt_token(resource)
            render json: { message: 'Signed in successfully', user: resource, token: token }
            return
          else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
            return
          end
        end
      end

      private

      def generate_jwt_token(resource)
        JWT.encode({ user_id: resource.id }, 'your_secret_key', 'HS256')
      end
    end
  end
end
