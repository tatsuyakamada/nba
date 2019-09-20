Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#logout'
  get 'admin' => 'admin#index'
  root 'top#index'

  # admin_menu
  namespace :admin do
    resources :articles
    resources :members
    resources :posts do
      resources :comments, only: %i[create destroy]
    end
    resources :players do
      resources :team_players
      collection do
        get 'player_import'
      end
    end
    resources :schedules
    resources :teams
  end
  resources :conferences
  resources :divisions
  resources :positions

  # general_menu
  resources :articles, only: %i[index show]
  resources :members do
    resources :posts, only: [:index]
  end
  resources :posts do
    resources :comments, only: %i[create destroy]
  end
  resources :players do
    resources :team_players, only: [:show]
  end
  resources :headcoaches
  resources :schedules, only: [:index]
  resources :teams
end
