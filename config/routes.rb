Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  root to: 'welcome#index'
  get 'portfolio', to: 'users#portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'friends', to: 'users#friends'
end
