class Api::V1::SessionsController < ApplicationController
    acts_as_token_authentication_handler_for User, only:[:logout]
    def login
        user = User.find_by!(email: login_params[:email])
        raise StandardError if !user.valid_password?(login_params[:password])
        
        render json: user, serializer: SessionSerializer, status: :ok
    rescue StandardError => e
        p e
        render json: { message: 'Wrong email or password' }, status: :unauthorized
    end

    def logout
        current_user.authentication_token = nil
        current_user.save!
        render json: {message: "deslogado com sucesso!"}, status: :ok
        #head(:ok)
    rescue StandardError => e
        render json: {message: e.message}, status: :bad_request
    end

    private

    def login_params
        params.require(:user).permit(
            :email,
            :password
        )
    end
end
