Rails.application.routes.draw do
  get 'city/:city_id', to: 'city#show', as: 'city'
  resources :users
  root 'homepage#index'
  get 'welcome/:user_entry', to: 'welcome#show'
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show'
  resources :gossips do
    resources :comments
    resources :likes
  end
  resources :sessions

end
