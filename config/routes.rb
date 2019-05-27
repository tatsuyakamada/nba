Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#logout'
  get 'members/index'
  get 'members/new'
  get 'members/edit'
  root "top#index"

  resources :articles
  resources :members do
   resources :posts, only: [:index]
  end
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
