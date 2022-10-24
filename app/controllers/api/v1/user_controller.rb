class Api::V1::UserController < ApplicationController

    def index
        page = params[:page] ? params[:page].to_i : 1
        per_page = params[:per_page] ? params[:per_page].to_i : User.all.length
        offset = page >= 1 ? (page - 1) * per_page : 0
        genre = User.all.limit(per_page).offset(offset)
        render json: genre, status: :ok
    end

    private

    def user_params
        params.require(:genre).permit(:name, :profile_picture)
    end
end
