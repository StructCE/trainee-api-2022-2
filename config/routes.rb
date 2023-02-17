Rails.application.routes.draw do
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do

      scope 'sessions' do
        post 'login', to: 'sessions#login'
        get 'logout', to: 'sessions#logout'
      end

      scope 'genre' do
        get 'index(/page/:page/per_page/:per_page)', to: 'genre#index'
        get 'index_paginated/page/:page/per_page/:per_page', to: 'genre#index_paginated'
        get 'show/:id', to: 'genre#show'
        post 'create', to: 'genre#create'
        patch 'update/:id', to: 'genre#update' 
        delete 'delete/:id', to: 'genre#delete'
      end
      scope 'user' do
        get 'show/:id', to: 'user#show'
        get 'index(/page/:page/per_page/:per_page)', to: 'user#index'
        post 'create', to: 'user#create'
        delete 'delete/:id', to: 'user#delete'
        post 'add_profile_picture/:id', to: 'user#add_profile_picture'
      end
      scope 'movie' do
        get 'index(/page/:page/per_page/:per_page)', to: 'movie#index'
      end
    end
  end
end
