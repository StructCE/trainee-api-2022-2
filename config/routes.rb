Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      scope 'genre' do
        get 'index(/page/:page/per_page/:per_page)', to: 'genre#index'
        get 'index_paginated/page/:page/per_page/:per_page', to: 'genre#index_paginated'
        get 'show/:id', to: 'genre#show'
        post 'create', to: 'genre#create'
        patch 'update/:id', to: 'genre#update' 
        delete 'delete/:id', to: 'genre#delete'
      end
    end
  end
end
