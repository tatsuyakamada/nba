Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#logout'
  get 'admin' => 'admin#index'
  root "top#index"

  #管理者用メニュー
    namespace :admin do
      resources :articles
      resources :members
      resources :posts do
        resources :comments, only: [:create, :destroy]
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


  #一般用メニュー
  resources :articles, only: [:index, :show]
  resources :members do
    resources :posts, only: [:index]
  end
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :players do
    resources :team_players, only:[:show]
  end
  resources :headcoaches
  resources :schedules, only:[:index]
  resources :teams

end
