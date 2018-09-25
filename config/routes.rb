Rails.application.routes.draw do

  get 'sessions/new'

  resources :pictures do
    collection do
      post :confirm
    end
  end
  get '/favorites/:id', to: 'users#fav_pictures'
  resources :users
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
