module Api
  module V1
    class PasswordsController < Devise::PasswordsController
      respond_to :json

      def forgot
        if params[:email].blank?
          return render json: { error: 'Email not present' }
        end

        user = User.find_by(email: params[:email])

        if user.present?
          user.send_reset_password_instructions
          render json: { message: 'Reset password instructions sent' }
        else
          render json: { error: ['Email address not found. Please check and try again.'] }, status: :not_found
        end
      end

      def reset
        token = params[:reset_password_token].to_s

        if params[:password].blank?
          return render json: { error: 'Password not present' }
        end

        user = User.with_reset_password_token(token)

        if user.present? && user.reset_password_period_valid?
          if user.reset_password(params[:password], params[:password_confirmation])
            render json: { message: 'Password successfully updated' }
          else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: ['Link not valid or expired. Try generating a new link.'] }, status: :not_found
        end
      end
    end
  end
end
