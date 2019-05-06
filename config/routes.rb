Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#logout'
  get 'members/index'
  get 'members/new'
  get 'members/edit'
  root "top#index"

  resources :articles
  resources :members

end
