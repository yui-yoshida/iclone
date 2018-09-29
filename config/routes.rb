Rails.application.routes.draw do
  # root to: 'sessions/new'

  resources :pictures do
    collection do
      post :confirm
    end
  end
  # get '/favorites/:id', to: 'users#fav_pictures'
  resources :users
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
