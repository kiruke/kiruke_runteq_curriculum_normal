Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'static_pages#top'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to:  'user_sessions#destroy'
  resources :users, only: [:new, :create]
  resources :bookmarks, only: [:create, :destroy]
  resource :profiles, only: [:show, :edit, :update]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :boards do
    get 'bookmarks', 'serach' , on: :collection
    resources :comments, shallow: true
  end
  namespace :admin do
    root 'dashboards#index'
    get '/login', to: 'user_sessions#new'
    post '/login', to: 'user_sessions#create'
    delete '/logout', to:  'user_sessions#destroy'
  end
  
  
  #間違ってつけたルーティング
  #resources :users_sessions, only: [:new, :create, :delete]
end
