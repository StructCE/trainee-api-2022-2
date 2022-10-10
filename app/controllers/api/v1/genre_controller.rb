class Api::V1::GenreController < ApplicationController
    def index
        genre = Genre.all
        render json: genre, status: :ok
    end

    def show
        genre = Genre.find(params[:id])
        render json: genre, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        genre = Genre.new(genre_params)
        genre.save!
        render json: genre, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end


    private

    def genre_params
        params.require(:genre).permit(:name)
    end
end
