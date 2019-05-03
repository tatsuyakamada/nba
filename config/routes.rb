Rails.application.routes.draw do
  get 'members/index'
  get 'members/new'
  get 'members/edit'
  root "top#index"

  resources :articles
  resources :members

end
