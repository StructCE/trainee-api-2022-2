class Api::V1::GenreController < ApplicationController

    # acts_as_token_authentication_handler_for Admin, only:[:create, :update, :delete]
    def index
        page = params[:page] ? params[:page].to_i : 1
        per_page = params[:per_page] ? params[:per_page].to_i : Genre.all.length
        offset = page >= 1 ? (page - 1) * per_page : 0
        genre = Genre.all.limit(per_page).offset(offset)
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

    def update
        genre = Genre.find(params[:id])
        genre.update!(genre_params)
        render json: genre, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        genre = Genre.find(params[:id])
        genre.destroy!
        render json: genre, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end




    private

    def genre_params
        params.require(:genre).permit(:name)
    end
end
