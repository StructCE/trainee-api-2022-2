class Api::V1::MovieController < ApplicationController

    def index
        page = params[:page] ? params[:page].to_i : 1
        per_page = params[:per_page] ? params[:per_page].to_i : Movie.all.length
        offset = page >= 1 ? (page - 1) * per_page : 0
        genre = Movie.all.limit(per_page).offset(offset)
        render json: genre, status: :ok
    end

    private

    def movie_params
        params.require(:genre).permit(:name, movies: [])
    end
end
