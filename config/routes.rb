Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, controllers: { confirmations: 'confirmations', sessions: 'sessions' }, path: '', path_names: { sign_in: 'login' }
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end
  
  resources :likes, only: [:create, :destroy]

  namespace :api do # /api
    namespace :v1 do # /api/v1
      resources :users, only: [:index, :show] do # api/v1/users
        resources :posts, only: [:index], format: :json do #api/v1/users/:user_id/posts
          resources :comments, only: [:index, :create], format: :json #api/v1/users/:user_id/posts/:post_id/comments
        end
      end
    end
  end

end
