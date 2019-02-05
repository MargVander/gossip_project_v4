Rails.application.routes.draw do
  get 'users/:user_id', to: 'users#show', as: 'user'
  #get 'gossips/:gossip_id', to: 'gossips#show', as: 'gossip'
  root 'homepage#index'
  get 'welcome/:user_entry', to: 'welcome#show'
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show'
  resources :gossips
end
