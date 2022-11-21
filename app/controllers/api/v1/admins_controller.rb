class Api::V1::AdminsController < ApplicationController
    acts_as_token_authentication_handler_for Admin, only:[:logout]
    def login
        admin = Admin.find_by!(email: params[:email])
        if admin.valid_password?(params[:password])
            render json: admin, status: :ok
        else
            head(:unauthorized)
        end
    rescue StandardError => e
        render json: {messege: e.message}, status: :unauthorized
    end

    def logout
        current_admin.authentication_token = nil
        current_admin.save!
        render json: {message: "deslogado com sucesso!"}, status: :ok
        #head(:ok)
    rescue StandardError => e
        render json: {message: e.message}, status: :bad_request
    end
end
