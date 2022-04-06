Rails.application.routes.draw do
  root 'static_pages#top'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to:  'user_sessions#destroy'
  resources :users, only: [:new, :create]
  
  #間違ってつけたルーティング
  #resources :users_sessions, only: [:new, :create, :delete]
end
