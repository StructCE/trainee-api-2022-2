require 'rails_helper'

RSpec.describe "Api::V1::Genres", type: :request do
  describe "GET /index" do
    before do
      create(:genre, id:1, name: 'Romance')
      create(:genre, id:2, name: 'Aventura')
    end
    context 'when index return' do
      before do
        get '/api/v1/genre/index'
      end
      it 'return https status ok' do
        expect(response).to have_http_status(:ok)
      end
      it 'return a json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
      it 'resturn the created instances' do
        expect(JSON.parse(response.body)).to eq([{
          'created_at' => eval(Genre.find(1).created_at.to_json),
          'id' => 1,
          'name' => 'Romance',
          'updated_at' => eval(Genre.find(1).updated_at.to_json)
        },
        {
          'created_at' => eval(Genre.find(2).created_at.to_json),
          'id' => 2,
          'name' => 'Aventura',
          'updated_at' => eval(Genre.find(2).updated_at.to_json)
        }
        ])
      end
    end
  end
  describe ' GET /show' do
    let(:genre) {create(:genre)}
    context 'id exist' do
      before do
        get "/api/v1/genre/show/#{genre.id}"
      end
      it 'return a http status ok' do
        expect(response).to have_http_status(:ok)
      end
    end
    context 'id not found' do
      before do
        get "/api/v1/genre/show/-1"
      end
      it 'return http status not_found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
  describe 'POST /create' do
    let(:genre_params) do
      attributes_for(:genre)
    end
    context 'params are ok' do
      it 'return http status created' do
        post "/api/v1/genre/create", params: {genre: genre_params}
        expect(response).to have_http_status(:created)
      end
    end
    context 'whit bad params' do
      it 'when param is nill' do
        genre_params = nil
        post "/api/v1/genre/create", params: {genre: genre_params}
        expect(response).to have_http_status(:bad_request)
      end
      it 'when params is not unique' do
        post "/api/v1/genre/create", params: {genre: genre_params}
        post "/api/v1/genre/create", params: {genre: genre_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'PATCH /update/:id' do
    let(:genre1) {create(:genre, name: 'Genre1')}
    let(:genre2) {create(:genre, name: 'Genre2')}
    context 'params are ok' do
      it 'return http status ok' do
        patch "/api/v1/genre/update/#{genre1.id}", params: {genre: {name: "Aventura"}}
        expect(response).to have_http_status(:ok)
      end
    end
    context 'params are nil' do
      it 'return http status bad_request' do
        patch "/api/v1/genre/update/#{genre1.id}", params: {genre: {name: nil}}
        expect(response).to have_http_status(:bad_request)
      end
    end
    context 'params are not unique' do
      it 'return http status bad_request' do
        patch "/api/v1/genre/update/#{genre1.id}", params: {genre: {name: genre2.name}}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE /delete/:id' do
    let(:genre) {create(:genre)}
    context 'genre exists' do
      it 'return http status ok' do
        delete "/api/v1/genre/delete/#{genre.id}"
        expect(response).to have_http_status(:ok)
      end
    end
    context 'genre does not exist' do
      it 'return http status bad request' do
        delete "/api/v1/genre/delete/-1"
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
