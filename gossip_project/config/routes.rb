Rails.application.routes.draw do
  get 'users/:user_id', to: 'users#show', as: 'user'
  get 'gossips/:gossip_id', to: 'gossips#show', as: 'gossip'
  root 'homepage#home'
  get 'welcome/:user_entry', to: 'welcome#show'
  get 'contact', to: 'contact#home'
  get 'team', to: 'team#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
