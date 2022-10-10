Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      scope 'genre' do
        get 'index', to: 'genre#index'
        get 'show/:id', to: 'genre#show'
        post 'create', to: 'genre#create'
      end
    end
  end
end
