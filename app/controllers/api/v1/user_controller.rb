class Api::V1::UserController < ApplicationController

    def index
        page = params[:page] ? params[:page].to_i : 1
        per_page = params[:per_page] ? params[:per_page].to_i : User.all.length
        offset = page >= 1 ? (page - 1) * per_page : 0
        genre = User.all.limit(per_page).offset(offset)
        render json: genre, status: :ok
    end

    def create
        user = User.new(user_params)
        user.save!
        render json: user, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show
        render json: User.find(params[:id]), status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :not_found
    end
    

    def delete
        user = User.find(params[:id])
        user.destroy!
        render json: user, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def add_profile_picture
        user = User.find(params[:id])

        user.profile_picture.purge if user.profile_picture.attached?

        params[:profile_picture].each do |pf|
            user.profile_picture.attach(pf)
        end
        render json: user, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private

    def user_params
        params.require(:user).permit(:name, :is_admin, :profile_picture, :email, :password)
    end
end
